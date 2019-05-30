//
//  Constants.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//USER Default
let USER_EMAIL = "userEmail"
let USER_TOKEN = "token"
let USER_LOGIN = "loggedIn"

//URL
let BASE_URL = "http://localhost:3005/v1/"
let AUTH_REGISTER = "\(BASE_URL)account/register"
let AUTH_LOGIN = "\(BASE_URL)account/login"
let ADD_USER = "\(BASE_URL)user/add"
let FIND_ALL_CHANNELS = "\(BASE_URL)channel"
let FIND_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"

//HEADER & BODY
let HEADER = ["Content-Type":"application/json; charset=utf-8"]

//NOTI
let USER_DATA_DID_CHANGED = Notification.Name("user data did changed")
let CHANNEL_LOAD = Notification.Name("channel loaded")
