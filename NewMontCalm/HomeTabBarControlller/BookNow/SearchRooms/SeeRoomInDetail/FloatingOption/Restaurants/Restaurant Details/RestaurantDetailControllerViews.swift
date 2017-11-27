//
//  RestaurantDetailControllerViews.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 08/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension RestaurantDetailController{
    
    func addViews(){
        
        
        view.addSubview(imageGallery)


        if #available(iOS 11.0, *){
            imageGallery.anchorToTop(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        }else{
            imageGallery.anchorToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        }


        imageGallery.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true
        
       let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        view.addSubview(contentView)
        contentView.anchorWithConstantsToTop(top: imageGallery.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 40, rightConstant: 16)
        
        contentView.addSubview(restaurantName)
        restaurantName.anchorWithConstantsToTop(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        restaurantName.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        
        
        contentView.addSubview(restaurantdetail)
        restaurantdetail.anchorWithConstantsToTop(top: restaurantName.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

    }
}
