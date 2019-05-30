//
//  LoginVC.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlet
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        
    }
    
    @IBAction func gotoCreateAC(_ sender: Any) {
        performSegue(withIdentifier: "gotoCreateAC", sender: nil)
    }
    
    
    func setupView() {
        spiner.isHidden = true
    }
    
}//End Of The Class
