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
        calendarContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        calendarContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        calendarContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true

        calendarContainerView.addSubview(calendar)
        calendar.leftAnchor.constraint(equalTo: calendarContainerView.leftAnchor,constant: 8).isActive = true
        calendar.rightAnchor.constraint(equalTo: calendarContainerView.rightAnchor,constant: -8).isActive = true
        calendar.bottomAnchor.constraint(equalTo: calendarContainerView.bottomAnchor,constant: -8).isActive = true
        calendar.topAnchor.constraint(equalTo: calendarContainerView.topAnchor,constant: 8).isActive = true


        checkInView = CardView()
        view.addSubview(checkInView)
        checkInView.leftAnchor.constraint(equalTo: calendarContainerView.leftAnchor, constant: 16).isActive = true
        checkInView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 96)/2).isActive = true
        checkInView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        checkInView.bottomAnchor.constraint(equalTo: calendarContainerView.topAnchor, constant: -24).isActive = true

        checkInView.addSubview(checkInButton)
        checkInButton.leftAnchor.constraint(equalTo: checkInView.leftAnchor).isActive = true
        checkInButton.rightAnchor.constraint(equalTo: checkInView.rightAnchor).isActive = true
        checkInButton.bottomAnchor.constraint(equalTo: checkInView.bottomAnchor).isActive = true
        checkInButton.topAnchor.constraint(equalTo: checkInView.topAnchor).isActive = true


        checkOutView = CardView()
        view.addSubview(checkOutView)

        checkOutView.leftAnchor.constraint(equalTo: checkInView.rightAnchor, constant: 16).isActive = true
        checkOutView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 96)/2).isActive = true
        checkOutView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        checkOutView.bottomAnchor.constraint(equalTo: calendarContainerView.topAnchor, constant: -24).isActive = true
        checkOutView.addSubview(checkOutButton)
        checkOutButton.leftAnchor.constraint(equalTo: checkOutView.leftAnchor).isActive = true
        checkOutButton.rightAnchor.constraint(equalTo: checkOutView.rightAnchor).isActive = true
        checkOutButton.bottomAnchor.constraint(equalTo: checkOutView.bottomAnchor).isActive = true
        checkOutButton.topAnchor.constraint(equalTo: checkOutView.topAnchor).isActive = true

    }
}



