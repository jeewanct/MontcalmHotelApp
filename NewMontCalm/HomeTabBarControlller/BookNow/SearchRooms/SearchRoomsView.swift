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

        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true

        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.addSubview(view)
        view.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)


        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true

        addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: callButton.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 0)
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true

        addSubview(bookNowButton)
        bookNowButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: uberButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
        bookNowButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 3 ).isActive = true

        addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 32, bottomConstant: 0, rightConstant: 32)


    }
}
