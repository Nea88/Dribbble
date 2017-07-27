//
//  File.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case login = "Login"
    case feed = "Feed"

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    var initialViewController: UIViewController? {
        return instance.instantiateInitialViewController()
    }
    
    func viewController<T: UIViewController>(_ viewControllerClass: T.Type) -> T {
        let storyboardId = (viewControllerClass as UIViewController.Type).storyboardId
        guard let controller = instance.instantiateViewController(withIdentifier: storyboardId) as? T
            else { fatalError() }
        return controller
    }
}

extension UIViewController {
    
    @nonobjc class var storyboardId: String {
        return "\(self)"
    }
    
    static func instantiate(from storyboard: AppStoryboard) -> Self {
        return storyboard.viewController(self)
    }
    
}
