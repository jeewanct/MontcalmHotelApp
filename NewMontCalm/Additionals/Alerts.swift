//
//  Alerts.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 11/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class CustomAlerts{
    static let shared = CustomAlerts()

    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String, controller: UIViewController){
        let alert = UIAlertController(title:
            alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
}
