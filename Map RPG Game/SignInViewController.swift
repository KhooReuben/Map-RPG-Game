//
//  SignInViewController.swift
//  Map RPG Game
//
//  Created by Reuben Khoo (s5065758) on 07/12/2018.
//  Copyright © 2018 Reuben Khoo (s5065758). All rights reserved.
//

import Foundation
import Firebase
import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailSignInTextField: UITextField!
    
    @IBOutlet weak var passwordSignInTextField: UITextField!
    @IBOutlet weak var redImageView: UIImageView!

    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var blueImageView: UIImageView!
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var greenImageView: UIImageView!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBAction func signUpButton(_ sender: UIButton) {
    
        guard let email = emailSignInTextField.text, let password = passwordSignInTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(authResult, error) in
            
            guard let user = authResult?.user else { return }
            
            if error == nil {
                ref.child("users").child((user?.uid)!).setValue(email, withCompletion: (user, error) in
                    if let _ = user {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instaniateViewController(withIdentifier: "MapViewController") as! MapViewController
                    self.present(vc, animated: true, completion: nil)
                
                }
                
                
            }
            
            
            
        })
            }
            
            if let _ = user {
                self.dismiss(animated: true, completion: nil)
            }
        }

