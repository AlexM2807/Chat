//
//  Constants.swift
//  Chat
//
//  Created by Alexandru Maftei on 2/12/20.
//  Copyright © 2020 Alexandru Maftei. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool) -> ()

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


// API
let API_URL = "https://exilodchat.herokuapp.com/v1/"
let API_REGISTER_USER = "\(API_URL)account/register"


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
