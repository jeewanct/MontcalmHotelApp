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
        allHotelsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true



        let downImage = UIImageView()
        downImage.translatesAutoresizingMaskIntoConstraints = false
        downImage.image = #imageLiteral(resourceName: "down").withRenderingMode(.alwaysOriginal)
        allHotelsButton.addSubview(downImage)
        downImage.centerYAnchor.constraint(equalTo: allHotelsButton.centerYAnchor).isActive = true
        downImage.rightAnchor.constraint(equalTo: allHotelsButton.rightAnchor, constant: -16).isActive = true
        downImage.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.3).isActive = true
        downImage.widthAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.3).isActive = true


        // Check in & out button
        addSubview(checkInButton)
        addSubview(checkOutButton)
        checkInButton.anchorWithConstantsToTop(top: allHotelsButton.bottomAnchor, left: leftAnchor, bottom: nil, right: checkOutButton.leftAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        checkOutButton.anchorWithConstantsToTop(top: allHotelsButton.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 16)
        checkInButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 44) / 2 ).isActive = true
        checkInButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 2.5).isActive = true
        checkOutButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 2.5).isActive = true


        let checkInLabel  = UILabel()
        checkInLabel.translatesAutoresizingMaskIntoConstraints = false
        checkInLabel.text = "Check In"
        checkInLabel.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        checkInLabel.adjustsFontSizeToFitWidth = true
        checkInLabel.minimumScaleFactor = 0.1
        checkInLabel.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
        checkInButton.addSubview(checkInLabel)
        checkInLabel.anchorWithConstantsToTop(top: checkInButton.topAnchor, left: checkInButton.leftAnchor, bottom: nil, right: checkInButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkInLabel.heightAnchor.constraint(equalTo: checkInButton.heightAnchor, multiplier: 0.13).isActive = true


        let checkOutLabel  = UILabel()
        checkOutLabel.translatesAutoresizingMaskIntoConstraints = false
        checkOutLabel.text = "Check Out"
        checkOutLabel.adjustsFontSizeToFitWidth = true
        checkOutLabel.minimumScaleFactor = 0.1
        checkOutLabel.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        checkOutLabel.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)

        checkOutButton.addSubview(checkOutLabel)
        checkOutLabel.anchorWithConstantsToTop(top: checkOutButton.topAnchor, left: checkOutButton.leftAnchor, bottom: nil, right: checkOutButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkOutLabel.heightAnchor.constraint(equalTo: checkOutButton.heightAnchor, multiplier: 0.13).isActive = true


        checkInButton.addSubview(checkInDate)
        checkInDate.anchorWithConstantsToTop(top: checkInLabel.bottomAnchor, left: checkInButton.leftAnchor, bottom: checkInButton.bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkInDate.widthAnchor.constraint(equalTo: checkInButton.widthAnchor, multiplier: 0.35).isActive = true

        checkOutButton.addSubview(checkOutDate)
        checkOutDate.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: checkOutButton.leftAnchor, bottom: checkOutButton.bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkOutDate.widthAnchor.constraint(equalTo: checkOutButton.widthAnchor, multiplier: 0.35).isActive = true


        checkInButton.addSubview(checkInYearLabel)
        checkInYearLabel.anchorWithConstantsToTop(top: checkInDate.topAnchor, left: checkInDate.rightAnchor, bottom: checkInDate.bottomAnchor, right: checkInButton.rightAnchor , topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 16)

        checkOutButton.addSubview(checkOutYearLabel)
        checkOutYearLabel.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: checkOutDate.rightAnchor, bottom: checkOutButton.bottomAnchor, right: checkOutButton.rightAnchor , topConstant: 8, leftConstant: 8, bottomConstant: 16, rightConstant: 16)




        // Enter Promo Code
        addSubview(promoText)
        promoText.anchorWithConstantsToTop(top: checkInButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
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



        addSubview(ourPropertiesCollectionView)
        ourPropertiesCollectionView.anchorWithConstantsToTop(top: ourPropertiesView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        ourPropertiesCollectionView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

        addSubview(termAndConditionButton)
        addSubview(privacyStatmentButton)

        termAndConditionButton.anchorWithConstantsToTop(top: ourPropertiesCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        termAndConditionButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        termAndConditionButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.9).isActive = true


        privacyStatmentButton.anchorWithConstantsToTop(top: ourPropertiesCollectionView.bottomAnchor, left: termAndConditionButton.rightAnchor , bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 16, rightConstant: 16)

        privacyStatmentButton.heightAnchor.constraint(equalTo: allHotelsButton.heightAnchor, multiplier: 0.9).isActive = true

        let socialCollectionView = SocialNetworkingView()
        addSubview(socialCollectionView)
        socialCollectionView.anchorWithConstantsToTop(top: privacyStatmentButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        socialCollectionView.heightAnchor.constraint(equalToConstant: 126).isActive = true


    



    }
}
