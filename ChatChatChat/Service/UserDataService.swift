//
//  UserDataService.swift
//  ChatChatChat
//
//  Created by formathead on 27/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var email = ""
    public private(set) var name = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    
    func setUserinfo(id: String, email: String, name: String, avatarName: String, avatarColor: String) {
        self.id = id
        self.email = email
        self.name = name
        self.avatarName = avatarName
        self.avatarColor = avatarColor
    }
    
    func setAvatarName(name: String) {
        self.avatarName = name
    }
    
    func returnAvatarColor(component: String) -> UIColor {
        let scanner = Scanner(string: component)
        let skip = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        
        scanner.charactersToBeSkipped = skip
        var r, g, b, a: NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        let returnColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return returnColor
    }
    
}//End Of The Class

