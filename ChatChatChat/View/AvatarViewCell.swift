//
//  AvatarViewCell.swift
//  ChatChatChat
//
//  Created by formathead on 27/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
enum AvatarType {
    case dark
    case light
}

class AvatarViewCell: UICollectionViewCell {
    
    //Outlet
    @IBOutlet weak var avatarIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setAvatarImg(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarIMG.image = UIImage(named: "dark\(index)")
        } else {
            avatarIMG.image = UIImage(named: "light\(index)")
        }
        
    }
    
}//End Of The Class

