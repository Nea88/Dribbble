//
//  Images.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift
import DribbbleSwift

class Images: Object {
    dynamic var hidpi: String?
    dynamic var normal: String!
    dynamic var teaser: String!
    
    required convenience init?(_ image: ImagesDS) {
        self.init()
        hidpi = image.hidpi
        normal = image.normal
        teaser = image.teaser
    }
}
