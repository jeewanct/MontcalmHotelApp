//
//  ReservationSummaryDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension ReservationSummary{

    @objc func handleConfirmStay(){
        present(UINavigationController(rootViewController:SignUpController()), animated: true, completion: nil)
//        navigationController?.pushViewController(, animated: true)
    }

}
