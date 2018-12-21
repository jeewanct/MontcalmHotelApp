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
        addSubview(bookHotelButton)

        
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bookHotelButton.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 4, rightConstant: 32 )



        let locationImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "marker"))
        addSubview(locationImage)

        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: locationImage.rightAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 4, bottomConstant: 16, rightConstant: 16)
        locationButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 112) / 1.5).isActive = true



        locationImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationImage.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        locationImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true



        let milesImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "miles"))
        addSubview(milesImage)


        addSubview(milesButton)
        milesButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: milesImage.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 4, bottomConstant: 4, rightConstant: 32)


        milesImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        milesImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        milesImage.centerYAnchor.constraint(equalTo: milesButton.centerYAnchor).isActive = true
        milesImage.leftAnchor.constraint(equalTo: locationButton.rightAnchor, constant: 8).isActive = true




        let callImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "call-answer"))
        addSubview(callImage)

        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: locationButton.bottomAnchor , left: callImage.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 4, bottomConstant: 4, rightConstant: 16)

        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 112) / 2).isActive = true


        callImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.centerYAnchor.constraint(equalTo: callButton.centerYAnchor).isActive = true
        callImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true


        let whatsAppImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "whatsapp-logo"))
        addSubview(whatsAppImage)

        addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: locationButton.bottomAnchor, left: whatsAppImage.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 4, bottomConstant: 4, rightConstant: 32)


        whatsAppImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.centerYAnchor.constraint(equalTo: whatsAppButton.centerYAnchor).isActive = true
        whatsAppImage.leftAnchor.constraint(equalTo: callButton.rightAnchor, constant: 8).isActive = true






        addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: callButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 32, bottomConstant: 16, rightConstant: 16)


        bookHotelButton.anchorWithConstantsToTop(top: startFromLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        bookHotelButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true









    }
}
