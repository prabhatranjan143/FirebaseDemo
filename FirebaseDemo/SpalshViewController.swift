//
//  SpalshViewController.swift
//  FirebaseDemo
//
//  Created by Prabhat on 25/11/18.
//  Copyright © 2018 Prabhat. All rights reserved.
//

import UIKit
import Firebase
class SpalshViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
             sleep(3)
            if Auth.auth().currentUser != nil{
                self.performSegue(withIdentifier: "spalshToDatabase", sender: self)
            }else{
                
                self.performSegue(withIdentifier: "spalshToLogin", sender: self)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        
       
    }
}
