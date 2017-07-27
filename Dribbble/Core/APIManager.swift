//
//  APIManager.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import DribbbleSwift
import RealmSwift

struct APIManager {
    public func getShots(success: @escaping () -> Void) {
        getShots(count: 50, page: 0, success: success)
    }
    
    func getShots(count: Int, page: Int, success: @escaping () -> Void) {
        
        DispatchQueue.global(qos: .utility).async {
            ShotsDS.getShots(perPage: count, page: page, sort: .recent) { apiData, shots in
                if let error = apiData.error {
                    AlertManager.shared.showErrorAlertWithTitle(error.helpAnchor, message: error.description, cancelButton: false)
                }
                
                let realm = try! Realm()
                let realmQueue = DispatchQueue(label: "realmQueue", qos: .utility)
                for shot in shots! {
                    if realm.object(ofType: Shot.self, forPrimaryKey: shot.id as AnyObject) != nil || shot.animated == true {
                        continue
                    }
                    
                    if shot.animated {
                        self.getShots(count: 1,
                                      page: page == 0 ? 51 : page + 1, success: success)
                    }
                    
                    realmQueue.sync{
                        guard let shotObject = Shot(shot) else { return }
                        try! realm.write {
                            realm.add(shotObject)
                        }
                        
                    }
                }
                success()
            }
        }
    }
}
