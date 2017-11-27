//
//  ReservationSummaryViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension ReservationSummary{

    func addViews(){
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        bottomView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true

        bottomView.addSubview(confirmStayButton)
        confirmStayButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        confirmStayButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.6).isActive = true
        confirmStayButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16).isActive = true
        confirmStayButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 16).isActive = true
    }
}
