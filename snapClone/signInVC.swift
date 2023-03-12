//
//  ViewController.swift
//  snapClone
//
//  Created by Oğuzhan Abuhanoğlu on 5.12.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class signInVC : UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
     
         @IBAction func signInButton(_ sender: Any) {
             
             if emailText.text != "" && passwordText.text != "" {
                 
                 Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { result, error in
                     if error != nil{
                         self.makeAlert(title: "Error", message: error!.localizedDescription)
                     }else{
                         self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                     }
                 }
             }else{
                 self.makeAlert(title: "Error", message: "email/password?")
             }
         }
         
         
         
        
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if emailText.text != "" && usernameText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                }else{
                    
                    let firestoreDatabase = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.usernameText.text,] as [String : Any]
                    
                    firestoreDatabase.collection("userInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
    
                }
            }
    }
}
    
    
    

    
    func makeAlert(title : String,message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
}
