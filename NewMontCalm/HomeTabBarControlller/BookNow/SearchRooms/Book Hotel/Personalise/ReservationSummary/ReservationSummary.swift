//
//  ReservationSummary.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ReservationSummary: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }

    func setup(){
        navigationItem.title = "Reservation Summary"
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
    }


    lazy var confirmStayButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CONFIRM STAY", for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(handleConfirmStay), for: .touchUpInside)
        return btn
    }()
    
}




