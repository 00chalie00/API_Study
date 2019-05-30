//
//  SocketService.swift
//  ChatChatChat
//
//  Created by formathead on 29/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    var manager: SocketManager!
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closedConnection() {
        socket.disconnect()
    }
    
    //Emit Method는 Sockiet.IO Client의 라이브러리를 사용하여 어떤 메세지든 서버에 보내기 위해 필요하다.
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    //Server부터 응답이 오면 그걸 Catch할 때 socket object의 on method를 사용한다.
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelID = dataArray[2] as? String else {return}
            
            let newChannel = Channel(id: channelID, name: channelName, description: channelDesc)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
}//End Of The Class

