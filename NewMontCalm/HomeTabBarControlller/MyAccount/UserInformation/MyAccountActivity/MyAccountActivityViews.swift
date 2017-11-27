//
//  MyAccountActivityViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension MyAccountActivityController{
    
    func addViews(){
        
        let upperView = UIView()
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.backgroundColor = .white
        view.addSubview(upperView)


        if #available(iOS 11.0, *){
            upperView.anchorToTop(top: view.safeAreaLayoutGuide
                .topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        }else{
            upperView.anchorToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        }


        upperView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        upperView.addSubview(movingView)
        movingView.anchorToTop(top: nil, left: upperView.leftAnchor, bottom: upperView.bottomAnchor, right: nil)
        movingView.heightAnchor.constraint(equalTo: upperView.heightAnchor, multiplier: 0.1).isActive = true
        movingView.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 0.5).isActive = true
        
        upperView.addSubview(upcomingBooking)
        upcomingBooking.anchorToTop(top: upperView.topAnchor, left: upperView.leftAnchor, bottom: movingView.topAnchor, right: nil)
        upcomingBooking.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 0.5).isActive = true
        
        upperView.addSubview(previousBookings)
        previousBookings.anchorToTop(top: upperView.topAnchor, left: upcomingBooking.rightAnchor, bottom: movingView.topAnchor, right: upperView.rightAnchor)
        
    }
}
