//
//  BookNowViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension BookNow{
    
    func addViews(){
        
        headerView = HeaderView()
        tableView.addSubview(headerView)
        headerView.addSubview(temperature)
        
        
        temperature.anchorWithConstantsToTop(top: nil, left: nil, bottom: headerView.bottomAnchor, right: headerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 8)
        headerView.addSubview(dayNightImage)
        
        dayNightImage.rightAnchor.constraint(equalTo: temperature.leftAnchor, constant: -8).isActive = true
        dayNightImage.centerYAnchor.constraint(equalTo: temperature.centerYAnchor).isActive = true
        dayNightImage.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.17).isActive = true
        dayNightImage.widthAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.17).isActive = true
        
    }
    
    
}


extension BookCell {
    func addViews(){

        // All Montcalm Hotels
        
        addSubview(allHotelsButton)
        allHotelsButton.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        //allHotelsButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        allHotelsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.063).isActive = true



        let downImage = UIImageView()
        downImage.translatesAutoresizingMaskIntoConstraints = false
        downImage.image = #imageLiteral(resourceName: "down").withRenderingMode(.alwaysOriginal)
        allHotelsButton.addSubview(downImage)
        downImage.centerYAnchor.constraint(equalTo: allHotelsButton.centerYAnchor).isActive = true
        downImage.rightAnchor.constraint(equalTo: allHotelsButton.rightAnchor, constant: -16).isActive = true
        downImage.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.3).isActive = true
        downImage.widthAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.3).isActive = true

        
        
    
        
        addSubview(dateView)
        dateView.anchorWithConstantsToTop(top: allHotelsButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.6).isActive = true


        // Enter Promo Code
        addSubview(promoText)
        promoText.anchorWithConstantsToTop(top: dateView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        //promoText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true

        promoText.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor).isActive = true
        // Login
        addSubview(selectCurrency)
        selectCurrency.anchorWithConstantsToTop(top: promoText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        selectCurrency.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor).isActive = true

        let downImage1 = UIImageView()
        downImage1.translatesAutoresizingMaskIntoConstraints = false
        downImage1.image = #imageLiteral(resourceName: "down").withRenderingMode(.alwaysOriginal)
        selectCurrency.addSubview(downImage1)
        downImage1.centerYAnchor.constraint(equalTo: selectCurrency.centerYAnchor).isActive = true
        downImage1.rightAnchor.constraint(equalTo: selectCurrency.rightAnchor, constant: -16).isActive = true
        downImage1.heightAnchor.constraint(equalTo: selectCurrency.heightAnchor, multiplier: 0.3).isActive = true
        downImage1.widthAnchor.constraint(equalTo: selectCurrency.heightAnchor, multiplier: 0.3).isActive = true

        // Search Rooms
        addSubview(searchRoomsButton)
        searchRoomsButton.anchorWithConstantsToTop(top: selectCurrency.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        searchRoomsButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor).isActive = true


        addSubview(whyBookHereButton)
        whyBookHereButton.anchorWithConstantsToTop(top: searchRoomsButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        whyBookHereButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor).isActive = true

        let ourPropertiesView = ViewWithTextAndLine()
        ourPropertiesView.constantLabel.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        ourPropertiesView.constantLineView.backgroundColor = .gray
        addSubview(ourPropertiesView)
        ourPropertiesView.anchorWithConstantsToTop(top: whyBookHereButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        ourPropertiesView.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.8).isActive = true


        let propertiesCollectionCardView = CardView()
        addSubview(propertiesCollectionCardView)
        propertiesCollectionCardView.anchorWithConstantsToTop(top: ourPropertiesView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        collectionHeightAnchor =  propertiesCollectionCardView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.06 * 2 + UIScreen.main.bounds.height * 0.065 * 2 )
        collectionHeightAnchor?.isActive = true
        

        propertiesCollectionCardView.addSubview(ourPropertiesCollectionView)
        ourPropertiesCollectionView.anchorWithConstantsToTop(top:  propertiesCollectionCardView.topAnchor, left:  propertiesCollectionCardView.leftAnchor, bottom:  propertiesCollectionCardView.bottomAnchor, right:  propertiesCollectionCardView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
       
        addSubview(termAndConditionButton)
        addSubview(privacyStatmentButton)



        let socialCollectionView = SocialNetworkingView()
        addSubview(socialCollectionView)
        socialCollectionView.anchorWithConstantsToTop(top: ourPropertiesCollectionView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 16, rightConstant: 16)
        socialCollectionView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        socialCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true


        termAndConditionButton.anchorWithConstantsToTop(top: nil, left: socialCollectionView.rightAnchor, bottom: nil, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 16, rightConstant: 16)
        termAndConditionButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 3).isActive = true
        termAndConditionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        termAndConditionButton.centerYAnchor.constraint(equalTo: socialCollectionView.centerYAnchor).isActive = true

        privacyStatmentButton.anchorWithConstantsToTop(top: nil, left: termAndConditionButton.rightAnchor , bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 16, rightConstant: 16)
        privacyStatmentButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        privacyStatmentButton.centerYAnchor.constraint(equalTo: socialCollectionView.centerYAnchor).isActive = true
    



    }
}
