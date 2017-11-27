//
//  PastStayViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 21/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension PastStayController{
    
    func addViews(){
        let secondView = tempViews()
        let thirdView = tempViews()
        
        

        view.addSubview(selectHotelButton)

        if #available(iOS 11.0, *){
            selectHotelButton.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }else{
            selectHotelButton.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }


        selectHotelButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        let selectDown = tempImage()
        selectHotelButton.addSubview(selectDown)
        selectDown.rightAnchor.constraint(equalTo: selectHotelButton.rightAnchor, constant: -16).isActive = true
        selectDown.heightAnchor.constraint(equalTo: selectHotelButton.heightAnchor, multiplier: 0.3).isActive = true
        selectDown.widthAnchor.constraint(equalTo: selectHotelButton.heightAnchor, multiplier: 0.3).isActive = true
        selectDown.centerYAnchor.constraint(equalTo: selectHotelButton.centerYAnchor).isActive = true
        
        
        
        view.addSubview(secondView)
        secondView.anchorWithConstantsToTop(top: selectHotelButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        secondView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 2).isActive = true
        
        
        view.addSubview(thirdView)
        thirdView.anchorWithConstantsToTop(top: selectHotelButton.bottomAnchor, left: secondView.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        thirdView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        view.addSubview(bookingReferenceText)
        bookingReferenceText.anchorWithConstantsToTop(top: thirdView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        bookingReferenceText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        
        view.addSubview(selectClaimButton)
        selectClaimButton.anchorWithConstantsToTop(top: bookingReferenceText.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        selectClaimButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        let selectDown1 = tempImage()
        selectClaimButton.addSubview(selectDown1)
        selectDown1.rightAnchor.constraint(equalTo: selectClaimButton.rightAnchor, constant: -16).isActive = true
        selectDown1.heightAnchor.constraint(equalTo: selectClaimButton.heightAnchor, multiplier: 0.3).isActive = true
        selectDown1.widthAnchor.constraint(equalTo: selectClaimButton.heightAnchor, multiplier: 0.3).isActive = true
        selectDown1.centerYAnchor.constraint(equalTo: selectClaimButton.centerYAnchor).isActive = true
        
        view.addSubview(commentsText)
        commentsText.anchorWithConstantsToTop(top: selectClaimButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        commentsText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(submitButton)
        submitButton.anchorWithConstantsToTop(top: commentsText.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        submitButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
    }
    
    func tempViews() -> UIView{
        let tempView = UIView()
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tempView
    }
    
    func tempImage() -> UIImageView{
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "down").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }
}
