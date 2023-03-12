//
//  SettingsVC.swift
//  snapClone
//
//  Created by Oğuzhan Abuhanoğlu on 6.12.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutButton(_ sender: Any) {
        
        do {
            
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignVC", sender: nil)
        }catch{
            
        }
            
    }
    
    

}
