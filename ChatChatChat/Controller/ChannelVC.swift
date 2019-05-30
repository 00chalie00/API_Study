//
//  ChannelVC.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue){}
    
    //Outlet
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var avatarIMG: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
//    //test
//    let array:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        AuthService.instance.logginIn = false
        
        //It is initialization when the MenuBTN Pressed
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
        
        //Notification
        NotificationCenter.default.addObserver(self, selector: #selector(userDataChanged(_:)), name: USER_DATA_DID_CHANGED, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
    }
    
    @IBAction func gotoLogin(_ sender: Any) {
        performSegue(withIdentifier: "gotoLogin", sender: nil)
    }
    
    func setupView() {
        if AuthService.instance.logginIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            avatarIMG.image = UIImage(named: UserDataService.instance.avatarName)
            avatarIMG.backgroundColor = UserDataService.instance.returnAvatarColor(component: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            avatarIMG.image = UIImage(named: "profileDefault")
            avatarIMG.backgroundColor = UIColor.clear
            tableView.reloadData()
        }
    }
    
    @objc func userDataChanged(_ notif: Notification ) {
        setupView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
        //return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            //cell.textLabel?.text = array[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    //Add Channel BTN
    @IBAction func addChannelBTN(_ sender: Any) {
        if AuthService.instance.logginIn {
            let addCh = AddChannelVC()
            addCh.modalPresentationStyle = .custom
            present(addCh, animated: true, completion: nil)
        }
    }
    
    
}//End Of The Class
