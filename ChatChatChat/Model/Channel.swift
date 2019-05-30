//
//  Channel.swift
//  ChatChatChat
//
//  Created by formathead on 29/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var id: String
    public private(set) var name: String
    public private(set) var description: String
}
