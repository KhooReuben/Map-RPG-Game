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


enum Team: Int {
    case red, blue, green
}


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailSignInTextField: UITextField!
    
    @IBOutlet weak var passwordSignInTextField: UITextField!
    
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        emailSignInTextField.text = "test@test.com"
        passwordSignInTextField.text = "password"
    }

    @IBAction func selectTeam(_ sender: UIButton) {
        team = Team.init(rawValue: sender.tag)
    }
    
    
 //
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
    
        guard let email = emailSignInTextField.text, let password = passwordSignInTextField.text, let team = team else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
            guard let user = authResult?.user else { return }
        
            self.setup(user: user, team: team)
            
        })
    }
            

    
    
    func setup(user: User, team: Team) {
        
        let ref = Firestore.firestore().collection("users").document(user.uid)
        
        ref.setData(["team": team.rawValue]) { error in
            AppManager.shared.appContainer.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

