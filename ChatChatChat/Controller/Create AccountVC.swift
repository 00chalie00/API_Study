//
//  Create AccountVC.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class Create_AccountVC: UIViewController {

    //Outlet
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var avatarIMG: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEndEdit))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            avatarIMG.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
        performSegue(withIdentifier: "gotoAvatar", sender: nil)
    }
    
    @IBAction func backgroundColor(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        avatarColor = "[\(r), \(g), \(b), 1]"
        bgColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        
        UIView.animate(withDuration: 0.2) {
            self.avatarIMG.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let useremail = email.text , email.text != "" else {return}
        guard let userpassword = password.text, password.text != "" else {return}
        guard let name = userName.text, userName.text != "" else {return}
        
        AuthService.instance.AuthRegister(email: useremail, password: userpassword) { (success) in
            if success {
                AuthService.instance.Authlogin(email: useremail, password: userpassword, completion: { (success) in
                    if success {
                        AuthService.instance.AddUser(name: name, email: useremail, avatarName: self.avatarName , avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                AuthService.instance.logginIn = true
                                self.performSegue(withIdentifier: "unwindSegue", sender: nil)
                                NotificationCenter.default.post(name: USER_DATA_DID_CHANGED, object: nil)
                    }
                })
            }
        })
      }
    }
  }
    
    @objc func tapEndEdit() {
        view.endEditing(true)
    }
    
    
}//End Of The Class

