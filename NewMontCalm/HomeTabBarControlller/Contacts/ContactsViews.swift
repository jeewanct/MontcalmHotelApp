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
        addSubview(exploreImage)
        exploreImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        exploreImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true

        exploreImage.addSubview(imageHeading)
        imageHeading.anchorWithConstantsToTop(top: exploreImage.topAnchor, left: exploreImage.leftAnchor, bottom: nil, right: exploreImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        imageHeading.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true

        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true

        addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: callButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
    }

}
