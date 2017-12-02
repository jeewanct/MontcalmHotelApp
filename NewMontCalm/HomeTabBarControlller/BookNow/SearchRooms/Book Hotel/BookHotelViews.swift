//
//  BookHotelViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension BookHotelNow{

    func addViews(){
        let headingView = UIView()
        headingView.translatesAutoresizingMaskIntoConstraints = false
        headingView.backgroundColor = .white
        view?.addSubview(headingView)
        headingView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        headingView.anchorToTop(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)

        if #available(iOS 11.0, *){
            headingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }else{
            headingView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        }


        headingView.addSubview(roomButton)
        headingView.addSubview(rateTypeButton)
        headingView.addSubview(flexibleDateButton)
        headingView.addSubview(movingView)

        roomButton.anchorToTop(top: headingView.topAnchor, left: headingView.leftAnchor, bottom: nil, right: nil)
        roomButton.heightAnchor.constraint(equalTo: headingView.heightAnchor, multiplier: 0.9).isActive = true
        roomButton.widthAnchor.constraint(equalTo: headingView.widthAnchor, multiplier: 1/3).isActive = true

        rateTypeButton.anchorToTop(top: headingView.topAnchor, left: roomButton.rightAnchor, bottom: nil, right: nil)
        rateTypeButton.heightAnchor.constraint(equalTo: headingView.heightAnchor, multiplier: 0.9).isActive = true
        rateTypeButton.widthAnchor.constraint(equalTo: headingView.widthAnchor, multiplier: 1/3).isActive = true

        flexibleDateButton.anchorToTop(top: headingView.topAnchor, left: rateTypeButton.rightAnchor, bottom: nil, right: headingView.rightAnchor)
        flexibleDateButton.heightAnchor.constraint(equalTo: headingView.heightAnchor, multiplier: 0.9).isActive = true

        movingView.anchorToTop(top: nil, left: headingView.leftAnchor, bottom: headingView.bottomAnchor, right: nil)
        movingView.heightAnchor.constraint(equalTo: headingView.heightAnchor, multiplier: 0.1).isActive = true
        movingView.widthAnchor.constraint(equalTo: headingView.widthAnchor, multiplier: 1/3).isActive = true



        // bootom view

        view.addSubview(containerView)
        containerView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        containerView.heightAnchor.constraint(equalToConstant:49).isActive = true

        containerView.addSubview(comparePricesButton)
        comparePricesButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        comparePricesButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8).isActive = true
        comparePricesButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 32) / 2).isActive = true
        comparePricesButton.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 8).isActive = true

        containerView.addSubview(bookNowButton)
        bookNowButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        bookNowButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8).isActive = true
        bookNowButton.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -8).isActive = true
        bookNowButton.leftAnchor.constraint(equalTo: comparePricesButton.rightAnchor,constant: 8).isActive = true

    }
    
}
