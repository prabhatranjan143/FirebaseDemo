//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Prabhat on 25/11/18.
//  Copyright © 2018 Prabhat. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    var handle : AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener{(auth, error) in
        
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    @IBAction func registerUser(_ sender: Any) {
        if registerEmail.text! == nil {
            print("Show Alert.")
            return
        } else if registerPassword.text! == nil{
            print("Password empty show alert.")
            return
        }else {
            Auth.auth().createUser(withEmail: registerEmail.text!, password: registerPassword.text!, completion: {(authResult,error) in
                
                if error != nil {
                    print("\(error)")
                }else{
                    
                    // Perform segue to database to login page
                    self.performSegue(withIdentifier: "registerToDatabase", sender: self)
                }
                
            })
        }
        
    }
    
}

