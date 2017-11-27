//
//  FloatingOffersViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension FloatingOffers{

    func addViews(){

        addSubview(hotelDetailTableView)
        hotelDetailTableView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
}
