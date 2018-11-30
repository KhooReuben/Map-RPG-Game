//  ViewController.swift
//  Map RPG Game
//
//  Created by Reuben Khoo (s5065758) on 23/11/2018.
//  Copyright © 2018 Reuben Khoo (s5065758). All rights reserved.
//

import UIKit

class AppContainerViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear (animated)
        AppManager.shared.appContainer = self
        AppManager.shared.showApp()
    }


}

