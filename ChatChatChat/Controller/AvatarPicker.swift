//
//  Avatat PickerVC.swift
//  ChatChatChat
//
//  Created by formathead on 24/05/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class AvatarPicker: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    //Outlet
    @IBOutlet weak var darklightToggle: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variable
    var avtype = AvatarType.dark

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarViewCell {
            cell.setAvatarImg(index: indexPath.item, type: avtype)
            return cell
        }
        return AvatarViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avtype == .dark {
            UserDataService.instance.setAvatarName(name: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(name: "light\(indexPath.item)")
        }
        print(UserDataService.instance.avatarName)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleDarkLight(_ sender: Any) {
        if darklightToggle.selectedSegmentIndex == 0 {
            avtype = .dark
        } else {
            avtype = .light
        }
        collectionView.reloadData()
    }
    
    
    
}//End Of The Class


