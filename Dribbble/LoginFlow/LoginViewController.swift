//
//  LoginViewController.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let authManager = AuthManager()
        authManager.logIn(with: self) {            
            guard let feedViewController = AppStoryboard.feed.initialViewController else { return }
            self.present(feedViewController, animated: true)
        }
    }
}
