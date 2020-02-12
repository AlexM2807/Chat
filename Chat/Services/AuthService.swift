//
//  AuthService.swift
//  Chat
//
//  Created by Alexandru Maftei on 2/12/20.
//  Copyright © 2020 Alexandru Maftei. All rights reserved.
//

import Foundation
import Alamofire

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
    
    
    
}
