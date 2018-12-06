//
//  LoginViewController.swift
//  Map RPG Game
//
//  Created by Reuben Khoo (s5065758) on 30/11/2018.
//  Copyright © 2018 Reuben Khoo (s5065758). All rights reserved.
//

import Foundation
import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            
            if let _ = user {
                self.dismiss(animated: true, completion: nil)
            }
        }
    
    }
    
    
    
    
    
    
}







