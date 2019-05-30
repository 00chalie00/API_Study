//
//  MessageService.swift
//  ChatChatChat
//
//  Created by formathead on 29/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    // Find All Channel
    func findAllChannels(completion: @escaping CompletionHandler) {
        let header = ["Authorization": "Bear \(AuthService.instance.token)"]
        
        Alamofire.request(FIND_ALL_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    if let json = try JSON(data: data).array {
                        for i in json {
                            let id = i["id"].stringValue
                            let name = i["name"].stringValue
                            let des = i["description"].stringValue
                            let channel = Channel(id: id, name: name, description: des)
                            self.channels.append(channel)
                        }
                        completion(true)
                    }
                } catch {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
        }
    }
    
    
    
}//End of The Class

