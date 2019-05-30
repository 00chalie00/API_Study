//
//  ViewController.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlet
    @IBOutlet weak var menuBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //It is action When the MenuBTN Pressed
        menuBTN.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleTap))
        view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.logginIn {
            AuthService.instance.findUserByEmail { (success) in
            NotificationCenter.default.post(name: USER_DATA_DID_CHANGED, object: nil)
            }
        }
    }
    
    @objc func toggleTap() {
        view.endEditing(true)
    }
}//End Of The Class

