//
//  MyAccountViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 21/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension MyAccount{
    
    
    func addViews(){




        view.addSubview(mainTableView)
      //mainTableView.parentInstance = self

        if #available(iOS 11.0, *){
            mainTableView.anchorToTop(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        }else{
            mainTableView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        }



       



    }
}


extension MyAccountMainCell{
    func addViews(){



        addSubview(backgroundImage)

        if #available(iOS 11.0, *){
            backgroundImage.anchorToTop(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        }else{
            backgroundImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        }

        backgroundImage.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

        let blackView = BlackView()
        backgroundImage.addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)


        backgroundImage.addSubview(memberIDLabel)
        memberIDLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
        memberIDLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true



        backgroundImage.addSubview(userName)
        userName.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: memberIDLabel.topAnchor, right: backgroundImage.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 0)
        userName.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true




        let pointsView = CardView()
        pointsView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)


        addSubview(pointsView)
        pointsView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        pointsView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.9 ).isActive = true

        pointsView.addSubview(currentPoints)
        currentPoints.attributedText = convertAttributeString(firstString: "Current Points\n", secondString: "0,000,000")
        currentPoints.anchorWithConstantsToTop(top: pointsView.topAnchor, left: pointsView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        currentPoints.widthAnchor.constraint(equalTo: pointsView.widthAnchor, multiplier: 0.4).isActive = true
        currentPoints.heightAnchor.constraint(equalTo: pointsView.heightAnchor, multiplier: 0.4).isActive = true


        pointsView.addSubview(qualifiedNights)
        qualifiedNights.attributedText = convertAttributeString(firstString: "Qualified Nights\n", secondString: "0,000,000")
        qualifiedNights.anchorWithConstantsToTop(top: pointsView.topAnchor, left: currentPoints.rightAnchor, bottom: nil, right: pointsView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        //  qualifiedNights.widthAnchor.constraint(equalTo: pointsView.widthAnchor, multiplier: 0.8).isActive = true
        qualifiedNights.heightAnchor.constraint(equalTo: pointsView.heightAnchor, multiplier: 0.4).isActive = true


        pointsView.addSubview(qualifiedStays)
        qualifiedStays.attributedText = convertAttributeString(firstString: "Qualified Stays\n", secondString: "0,000,000")
        qualifiedStays.anchorWithConstantsToTop(top: qualifiedNights.bottomAnchor, left: pointsView.leftAnchor, bottom: pointsView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        qualifiedNights.widthAnchor.constraint(equalTo: pointsView.widthAnchor, multiplier: 0.4).isActive = true






        let profileView = CardView()
        addSubview(profileView)

        profileView.addSubview(profileEditTable)
        profileEditTable.anchorToTop(top: profileView.topAnchor, left: profileView.leftAnchor, bottom: profileView.bottomAnchor, right: profileView.rightAnchor)



        if #available(iOS 11.0, *){
            profileView.anchorWithConstantsToTop(top: pointsView.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }else{
            profileView.anchorWithConstantsToTop(top: pointsView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        }



        //userName.heightAnchor.constraint(equalToConstant: 17).isActive = true



    }

    func convertAttributeString(firstString: String, secondString: String) -> NSMutableAttributedString{

        let convertedString =  NSMutableAttributedString(string: firstString, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1) ])
        convertedString.append(NSMutableAttributedString(string: secondString, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)]))

        return convertedString


    }
}
