//
//  AppDelegate.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit
import DribbbleSwift
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let token = UserDefaults.standard.object(forKey: "token")  {
            let authManager = AuthManager()
            authManager.auth(withToken: token as! String)
            guard let controller = AppStoryboard.feed.initialViewController else { return false }
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        } else {
            guard let controller = AppStoryboard.login.initialViewController else { return false }
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        }

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        OAuthSwift.handle(url: url)
        
        return true
    }

}

