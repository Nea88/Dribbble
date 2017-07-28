//
//  Contsants.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import OAuthSwift


struct authConstants {
    static let clientId = "ab3d9f9f2e4d08b75cf94696833505303a4d8df9355ee392ab3f6735014f3102"
    static let clientSecret = "35dd9c5010bcc9c0120276dba0d394cd1d64b865abb5c3ed43d8c4b65f3c36b9"
    static let clientAccessToken = "b790374f4ed7224f9dce28a47be08d59e9c057c798ccfd9d4b4d17879ae565df"
    static let oauthSwift = OAuth2Swift(
        consumerKey:    clientId,
        consumerSecret: clientSecret,
        authorizeUrl:   urls.oauthAuthorize,
        accessTokenUrl: urls.authToken,
        responseType:   "code"
    )

}

struct urls {
    static let main = "https://dribbble.com/"
    static let oauthAuthorize = main + "oauth/authorize"
    static let authToken = main + "oauth/token"

}
