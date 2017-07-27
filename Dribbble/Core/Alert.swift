//
//  Alert.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit

final class AlertManager {
    static let shared = AlertManager()
    
    var isAlertShown = false
    
    func showErrorAlertWithTitle(_ title: String? = nil,
                                 message: String? = nil,
                                 cancelButton: Bool = false,
                                 action: ((UIAlertAction) -> Void)? = nil) {
        guard let controller = UIApplication.shared.delegate!.window!!.rootViewController, !isAlertShown else { return }
        isAlertShown = true
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
            self.isAlertShown = false
            action?(alertAction)
        })
        alert.addAction(actionOK)
        if cancelButton {
            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel, handler: { _ in
                                                self.isAlertShown = false
            })
            alert.addAction(actionCancel)
        }
        let operation = BlockOperation {
            controller.present(alert, animated: true) { }
        }
        OperationQueue.main.addOperation(operation)
    }
}
