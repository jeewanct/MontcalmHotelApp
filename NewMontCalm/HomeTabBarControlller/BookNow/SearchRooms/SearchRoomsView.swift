//
//  SearchRoomsView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


extension SearchRooms{
    
    func addViews(){
        navigationController?.navigationBar.addSubview(checkInOutButton)
        checkInOutButton.centerXAnchor.constraint(equalTo: (navigationController?.navigationBar.centerXAnchor)!).isActive = true
        checkInOutButton.centerYAnchor.constraint(equalTo: (navigationController?.navigationBar.centerYAnchor)!).isActive = true
        checkInOutButton.heightAnchor.constraint(equalTo: (navigationController?.navigationBar.heightAnchor)!).isActive = true
        checkInOutButton.widthAnchor.constraint(equalTo: (navigationController?.navigationBar.widthAnchor)!, multiplier: 0.5).isActive = true

        checkInOutButton.addSubview(SearchRooms.checkInLabel)
        checkInOutButton.addSubview(SearchRooms.checkOutLabel)

        SearchRooms.checkInLabel.anchorToTop(top: checkInOutButton.topAnchor, left: checkInOutButton.leftAnchor, bottom: checkInOutButton.bottomAnchor, right: nil)
        SearchRooms.checkInLabel.widthAnchor.constraint(equalTo: checkInOutButton.widthAnchor, multiplier: 0.5).isActive = true

        SearchRooms.checkOutLabel.anchorToTop(top: checkInOutButton.topAnchor, left: nil, bottom: checkInOutButton.bottomAnchor, right: checkInOutButton.rightAnchor)
        SearchRooms.checkOutLabel.widthAnchor.constraint(equalTo: checkInOutButton.widthAnchor, multiplier: 0.5).isActive = true
    }


}


extension SearchRoomCell{

    func addViews(){


        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)


        let blackView = BlackView()
        addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)

        addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        callButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true

        addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: callButton.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 0)
        whatsAppButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        whatsAppButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true


        addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: whatsAppButton.bottomAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        uberButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        uberButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true


        addSubview(distanceButton)
        distanceButton.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        distanceButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true
        distanceButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2.5 ).isActive = true


        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: nil, left: distanceButton.rightAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 16)
        locationButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true



        addSubview(starRatingLabel)
        starRatingLabel.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: locationButton.topAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        starRatingLabel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/1.5).isActive = true
        starRatingLabel.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true

        addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: starRatingLabel.topAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        startFromLabel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/1.5).isActive = true
        startFromLabel.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true




//        addSubview(callButton)
//        callButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
//        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true
//
//        addSubview(uberButton)
//        uberButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: callButton.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 0)
//        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true
//
//        addSubview(bookNowButton)
//        bookNowButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: uberButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
//        bookNowButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true




    }
}
