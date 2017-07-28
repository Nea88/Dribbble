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
    let realm = try! Realm()
    
    public func getShots(success: @escaping () -> Void) {
        getShots(count: 50, page: 0, success: success)
    }
    
    func getShots(count: Int, page: Int, success: @escaping () -> Void) {
        if count == 0 { return }
        DispatchQueue.global(qos: .utility).async {
            ShotsDS.getShots(perPage: count, page: page, sort: .recent) { apiData, shots in
                if let error = apiData.error {
                    AlertManager.shared.showErrorAlertWithTitle("Error", message: error.localizedDescription, cancelButton: false)
                    return
                }
                
                guard let shotsDS = shots?.filter ({ shot in
                    !shot.animated || shot.id != nil || shot.user.id != nil
                }) else { return }
                
                self.writeShots(shotsDS)
                success()
            }
        }
    }
    
    func writeShots(_ shotsDS: [ShotsDS]) {
        DispatchQueue(label: "realmQueue", qos: .utility).sync{
            try! realm.write {
                shotsDS.forEach() { shotDS in
                    if let _ = realm.object(ofType: Shot.self, forPrimaryKey: shotDS.id as AnyObject) { return }
                    guard let shot = Shot(shotDS) else { return }
                    realm.add(shot, update: true)
                }
            }
        }
    }
}
