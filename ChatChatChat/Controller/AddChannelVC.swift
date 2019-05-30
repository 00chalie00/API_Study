//
//  AddChannelVC.swift
//  ChatChatChat
//
//  Created by formathead on 29/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createCH(_ sender: Any) {
        guard let channelName = name.text, name.text != "" else {return}
        guard let channelDes = desc.text else {return}
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDes) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    
}//End Of The Class

