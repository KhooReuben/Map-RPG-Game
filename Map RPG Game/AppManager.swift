//
//  AppManager.swift
//  Map RPG Game
//
//  Created by Reuben Khoo (s5065758) on 29/11/2018.
//  Copyright © 2018 Reuben Khoo (s5065758). All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AppManager {
    
    static let shared = AppManager ()
    private let storyboard = UIStoryboard (name: "Main", bundle: nil)
    private init () { }
    
    var appContainer: AppContainerViewController
    
    func showApp () {
    }
    
    func logout () {
    }
    
}
