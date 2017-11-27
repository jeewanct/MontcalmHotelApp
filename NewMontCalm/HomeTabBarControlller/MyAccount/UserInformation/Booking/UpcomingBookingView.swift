//
//  UpcomingBookingView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension UpcomingBookingController{

    func addViews(){
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(containerView)
        containerView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true

        containerView.addSubview(cancelButton)
        cancelButton.anchorWithConstantsToTop(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8)


        view.addSubview(contentTable)

        if #available(iOS 11.0, *){
            contentTable.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: containerView.topAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }else{
            contentTable.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: containerView.topAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }


    }
}
