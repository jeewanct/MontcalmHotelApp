//
//  ContactsViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension ContactsCell{
    func addViews(){



        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

        addSubview(hotelImage)
        hotelImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)



        let blackView = BlackView()
        hotelImage.addSubview(blackView)
        blackView.anchorToTop(top: hotelImage.topAnchor, left: hotelImage.leftAnchor, bottom: hotelImage.bottomAnchor, right: hotelImage.rightAnchor

        )

        hotelImage.addSubview(imageHeading)
        imageHeading.anchorWithConstantsToTop(top: hotelImage.topAnchor, left: hotelImage.leftAnchor, bottom: nil, right: hotelImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        //imageHeading.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true



        
        let locationImage = imageHeading.buttonIcons(image: #imageLiteral(resourceName: "marker"))
        hotelImage.addSubview(locationImage)
        
        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: imageHeading.bottomAnchor, left: locationImage.rightAnchor, bottom: nil, right: hotelImage.rightAnchor, topConstant: 16, leftConstant: 4, bottomConstant: 8, rightConstant: 16)
        //locationButton.heightAnchor.constraint(equalTo: hotelImage.heightAnchor, multiplier: 0.12)
        
        
        locationImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationImage.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        locationImage.leftAnchor.constraint(equalTo: hotelImage.leftAnchor, constant: 16).isActive = true

        
        
        
        
        let callImage = imageHeading.buttonIcons(image: #imageLiteral(resourceName: "call-answer"))
        hotelImage.addSubview(callImage)
        
        hotelImage.addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left:callImage.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 4, bottomConstant: 16, rightConstant: 8)
        callButton.heightAnchor.constraint(equalTo: hotelImage.heightAnchor, multiplier: 0.12)
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 112) / 2).isActive = true

        callImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.centerYAnchor.constraint(equalTo: callButton.centerYAnchor).isActive = true
        callImage.leftAnchor.constraint(equalTo: hotelImage.leftAnchor, constant: 16).isActive = true
        
        
        
        let whatsAppImage = imageHeading.buttonIcons(image: #imageLiteral(resourceName: "whatsapp-logo"))
        hotelImage.addSubview(whatsAppImage)
        
        hotelImage.addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: nil, left: whatsAppImage.rightAnchor, bottom: bottomAnchor, right: hotelImage.rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 16, rightConstant: 16)
        whatsAppButton.heightAnchor.constraint(equalTo: hotelImage.heightAnchor, multiplier: 0.12)

        
        whatsAppImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.centerYAnchor.constraint(equalTo: whatsAppButton.centerYAnchor).isActive = true
        whatsAppImage.leftAnchor.constraint(equalTo: callButton.rightAnchor, constant: 8).isActive = true

    }

}
