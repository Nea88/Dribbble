//
//  AuthManager.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import DribbbleSwift
import OAuthSwift


struct AuthManager {
    
    public func auth(withToken token: String) {
        UserDefaults.standard.set(token, forKey: "token")
        ConfigDS.setAccessToken(authConstants.clientAccessToken)
        ConfigDS.setOAuth2Token(token)
    }
    
    public func logOut() {
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    public func logIn(with controller: UIViewController, success: @escaping ()->()) {
        let handler = SafariURLHandler(viewController: controller, oauthSwift: authConstants.oauthSwift)
        
        authConstants.oauthSwift.authorizeURLHandler = handler
        
        let _ = authConstants.oauthSwift.authorize(
            withCallbackURL: URL(string: "dribbble://oauth-callback")!, scope: "public", state: "simple",
            success: { credential, response, parameters in
                self.auth(withToken: credential.oauthToken)
                success()
            },
                failure: { error in
                    AlertManager.shared.showErrorAlertWithTitle("Auth error", message: error.localizedDescription, cancelButton: false)
            }
        )
    }
}
