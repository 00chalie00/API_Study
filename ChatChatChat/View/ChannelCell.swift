//
//  ChannelCell.swift
//  ChatChatChat
//
//  Created by formathead on 28/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //Outlet
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(channel: Channel) {
        let title = channel.name
        channelName.text = title
    }
}
