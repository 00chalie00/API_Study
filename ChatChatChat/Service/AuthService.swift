//
//  AuthService.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    
    var userEmail: String {
        get {
            return defaults.value(forKeyPath: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    var token: String {
        get {
            return defaults.value(forKeyPath: USER_TOKEN) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_TOKEN)
        }
    }
    
    var logginIn: Bool {
        get {
            return defaults.bool(forKey: USER_LOGIN)
        }
        set {
            defaults.set(newValue, forKey: USER_LOGIN)
        }
    }
    
    func AuthRegister (email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body:[String:Any] = ["email": lowerCaseEmail, "password":password]
        
        Alamofire.request(AUTH_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (success) in
            if success.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(success.result.error as Any)
            }
        }
    }
    
    func Authlogin (email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body = ["email": lowerCaseEmail, "password": password]
        
        Alamofire.request(AUTH_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.token = json["token"].stringValue
                    completion(true)
                } catch {
                    completion(false)
                }
            }
        }
    }
    
    func AddUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let bearHeader = ["Authorization": "Bearer \(token)", "Content-Type": "application/json; charset=utf-8"]
        let body = ["name": name, "email": lowerCaseEmail, "avatarName": avatarName, "avatarColor": avatarColor]
        
        Alamofire.request(ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: bearHeader).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                    let id = json["_id"].stringValue
                    let name = json["name"].stringValue
                    let email = json["email"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let avatarColor = json["avatarColor"].stringValue
                    
                    UserDataService.instance.setUserinfo(id: id, email: email, name: name, avatarName: avatarName, avatarColor: avatarColor)
                    completion(true)
                } catch {
                    completion(false)
                }
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        let header = ["Authorization": "Bearer \(AuthService.instance.token)"]
        let url = "\(FIND_USER_BY_EMAIL)\(UserDataService.instance.email)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON {(response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                    let id = json["id"].stringValue
                    let name = json["name"].stringValue
                    let email = json["email"].stringValue
                    let avatarName = json["avatarNAme"].stringValue
                    let avatarColor = json["avatarColor"].stringValue
                    
                    UserDataService.instance.setUserinfo(id: id, email: email, name: name, avatarName: avatarName, avatarColor: avatarColor)
                    completion(true)
                } catch {
                    completion(false)
                }
            }
        }
    }
    
    
    
    
    
    
    
    

    
}//End of The Class
