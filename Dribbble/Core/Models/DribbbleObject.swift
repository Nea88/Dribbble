//
//  DribbbleObject.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 27.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift

class DribbbleObject: Object {
    dynamic var id: Int = 0
    override static func primaryKey() -> String? {
        return "id"
    }
}
