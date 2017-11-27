//
//  SearchRoomInDetailView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SeeRoomInDetail{
    
    func addViews(){

        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white

        view.addSubview(bottomView)
        bottomView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true

        bottomView.addSubview(calendarButton)
        calendarButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        calendarButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.6).isActive = true
        calendarButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        calendarButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16).isActive = true


        bottomView.addSubview(searchButton)
        searchButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.6).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        searchButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16).isActive = true



        // Adding  content table
       

    }
    
    
}
