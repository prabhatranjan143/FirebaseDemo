//
//  LoginViewController.swift
//  FirebaseDemo
//
//  Created by Prabhat on 25/11/18.
//  Copyright © 2018 Prabhat. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var loginEmail: UITextField!
    
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginUser(_ sender: Any) {
        if let email = loginEmail.text, let password = loginPassword.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error != nil{
                    // Show eeror message
                    print(error)
                }else{
                   // Perform Segue to database entry page
                    self.performSegue(withIdentifier: "loginToDatabase", sender: self)
                }
                
            }
        }else{
            // Show Alert for not authentication.
            print("Authentiction failed.")
            return
        }
        
        
    }
    
    @IBAction func SignUpPage(_ sender: Any) {
        performSegue(withIdentifier: "loginToRegister", sender: self)
    }
}
