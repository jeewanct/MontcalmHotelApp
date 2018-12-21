//
//  CalendarViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension CalendarController {

    func addViews(){
        view.addSubview(confirmButton)
        confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true


        let calendarContainerView = CardView()
        view.addSubview(calendarContainerView)
        calendarContainerView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -24).isActive = true
        calendarContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        calendarContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        calendarContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true

        calendarContainerView.addSubview(calendar)
        calendar.leftAnchor.constraint(equalTo: calendarContainerView.leftAnchor,constant: 8).isActive = true
        calendar.rightAnchor.constraint(equalTo: calendarContainerView.rightAnchor,constant: -8).isActive = true
        calendar.bottomAnchor.constraint(equalTo: calendarContainerView.bottomAnchor,constant: -8).isActive = true
        calendar.topAnchor.constraint(equalTo: calendarContainerView.topAnchor,constant: 8).isActive = true


        
        dateView.checkIn = Date()
        dateView.checkOut = LogicHelper.shared.addOneToDate(date: Date())
        dateView.delegate = self
        view.addSubview(dateView)
        
        dateView.anchorWithConstantsToTop(top: nil, left: view.leftAnchor, bottom: calendarContainerView.topAnchor, right: view.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.6).isActive = true
        

    }
}



