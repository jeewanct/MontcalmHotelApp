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

        addSubview(exploreImage)
        exploreImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)



        let blackView = BlackView()
        exploreImage.addSubview(blackView)
        blackView.anchorToTop(top: exploreImage.topAnchor, left: exploreImage.leftAnchor, bottom: exploreImage.bottomAnchor, right: exploreImage.rightAnchor

        )

        exploreImage.addSubview(imageHeading)
        imageHeading.anchorWithConstantsToTop(top: exploreImage.topAnchor, left: exploreImage.leftAnchor, bottom: nil, right: exploreImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        imageHeading.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true



        exploreImage.addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: imageHeading.bottomAnchor, left: exploreImage.leftAnchor, bottom: nil, right: exploreImage.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        locationButton.heightAnchor.constraint(equalTo: exploreImage.heightAnchor, multiplier: 0.12)
        

        exploreImage.addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left:exploreImage.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 8)
        callButton.heightAnchor.constraint(equalTo: exploreImage.heightAnchor, multiplier: 0.12)
        callButton.widthAnchor.constraint(equalTo: exploreImage.widthAnchor, multiplier: 0.4).isActive = true

        exploreImage.addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: nil, left: callButton.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 0)
        whatsAppButton.heightAnchor.constraint(equalTo: exploreImage.heightAnchor, multiplier: 0.12)
        whatsAppButton.widthAnchor.constraint(equalTo: exploreImage.widthAnchor, multiplier: 0.4).isActive = true



//        addSubview(callButton)
//        callButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
//        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
//
//        addSubview(uberButton)
//        uberButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: callButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
    }

}
