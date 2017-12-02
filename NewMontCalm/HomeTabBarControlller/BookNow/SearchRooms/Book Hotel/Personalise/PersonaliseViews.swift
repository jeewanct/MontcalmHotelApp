//
//  PersonaliseViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension PersonaliseController{
    
    func addViews(){
        let upperView = UIView()
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.backgroundColor = .white
        view.addSubview(upperView)


     //   if #available(iOS 11.0, *){
            upperView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        //}else{
            
       // }


        upperView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        upperView.addSubview(movingView)
        movingView.anchorToTop(top: nil, left: upperView.leftAnchor, bottom: upperView.bottomAnchor, right: nil)
        movingView.heightAnchor.constraint(equalTo: upperView.heightAnchor, multiplier: 0.1).isActive = true
        movingView.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 1/3).isActive = true
        
        upperView.addSubview(enhancmentButton)
        enhancmentButton.anchorToTop(top: upperView.topAnchor, left: upperView.leftAnchor, bottom: movingView.topAnchor, right: nil)
        enhancmentButton.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 1 / 3).isActive = true
        
        upperView.addSubview(aromasButton)
        aromasButton.anchorToTop(top: upperView.topAnchor, left: enhancmentButton.rightAnchor, bottom: movingView.topAnchor, right: nil)
        aromasButton.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 1 / 3).isActive = true
        
        
        upperView.addSubview(pillowsButton)
        pillowsButton.anchorToTop(top: upperView.topAnchor, left: aromasButton.rightAnchor, bottom: movingView.topAnchor, right: upperView.rightAnchor)



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
