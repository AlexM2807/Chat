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
let TO_AVATAR_PICKER = "toAvatarPicker"


// API
let API_URL = "https://exilodchat.herokuapp.com/v1/"
let API_REGISTER_USER = "\(API_URL)account/register"
let API_LOGIN_USER = "\(API_URL)account/login"
let API_CREATE_USER = "\(API_URL)user/add"

//Colors
let defaultPlaceholder = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 0.5)

// Nofitications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// HEADERS
let HEADERS = [
    "Content-Type": "application/json; charset=utf-8"
]

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Indentifires
let AVATAR_CELL = "avatarCell"
