//
//  AuthService.swift
//  Chat
//
//  Created by Alexandru Maftei on 2/12/20.
//  Copyright © 2020 Alexandru Maftei. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    // save user datail local
    let defaults = UserDefaults.standard
    
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey:  LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    // register user function
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(API_REGISTER_USER, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
                
            switch(response.result)  {
                case .success(_):
                    completion(true)

                case .failure(_):
                    completion(false)
                    break
            }
        
        }
        
    }
    
    // login user
    func loginUser(email:String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
           
        let headers: HTTPHeaders = [
           "Content-Type": "application/json; charset=utf-8"
        ]
       
        let body: [String: Any] = [
           "email": lowerCaseEmail,
           "password": password
        ]
        
        AF.request(API_LOGIN_USER, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
           switch(response.result)  {
                case .success(_):
                    
                  
                    guard let data = response.data else { return }
                    
                    do {
                        let json = try JSON(data: data)
                       
                        self.userEmail = json["user"].stringValue
                        self.authToken = json["token"].stringValue
                        
                        self.isLoggedIn = true
                        completion(true)
                    } catch _ {
                        print("ERROR")
                    }
                

                case .failure(_):
                    completion(false)
                    break
            }
            
        }
        
    }
    
    // create user
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
          "name": name,
          "email": lowerCaseEmail,
          "avatarName": avatarName,
          "avatarColor":avatarColor
       ]
        
        
        let header: HTTPHeaders = [
           "Authorization":"Bearer \(AuthService.instance.authToken)",
           "Content-Type": "application/json; charset=utf-8"
       ]
        
      
        
        AF.request(API_CREATE_USER, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch(response.result)  {
                case .success(_):
                    
                  
                    guard let data = response.data else { return }
                    
                    do {
                        let json = try JSON(data: data)
                       
                        let id = json["_id"].stringValue
                        let color = json["avatarColor"].stringValue
                        let avatarName = json["avatarName"].stringValue
                        let email = json["email"].stringValue
                        let name = json["name"].stringValue
                        
                         
                        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                        
                        self.isLoggedIn = true
                        completion(true)
                    } catch _ {
                        print("ERROR")
                    }
                

                case .failure(_):
                    completion(false)
                    break
            }
        }
    }
 
    
    
    
}
