//
//  MyAccountActivityViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//


import UIKit


extension MyAccountActivityCell{


    func addViews(){


        bookingIdLbl.attributedText = convertAttributeString(firstString: "Booking ID:\n", secondString: "adelonskdds")
        bookingDateLbl.attributedText = convertAttributeString(firstString: "Booking Date:\n", secondString: "26/10/2017")
        pointsEarnLbl.attributedText = convertAttributeString(firstString: "Points Earned from this booking: ", secondString: "20")



        let bookingIdView = UIView()
        bookingIdView.translatesAutoresizingMaskIntoConstraints = false
        bookingIdView.backgroundColor = .white

        let bookingDateView = UIView()
        bookingDateView.translatesAutoresizingMaskIntoConstraints = false
        bookingDateView.backgroundColor = .white

        let reservationDateView = UIView()
        reservationDateView.translatesAutoresizingMaskIntoConstraints = false
        reservationDateView.backgroundColor = .white

        let pointsEarnView = UIView()
        pointsEarnView.translatesAutoresizingMaskIntoConstraints = false
        pointsEarnView.backgroundColor = .white


        addSubview(bookingIdView)
        addSubview(bookingDateView)
        addSubview(reservationDateView)
        addSubview(pointsEarnView)
        addSubview(conditionButton)

        bookingIdView.addSubview(bookingIdLbl)
        bookingDateView.addSubview(bookingDateLbl)
        pointsEarnView.addSubview(pointsEarnLbl)

        bookingIdView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        bookingIdView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        bookingIdView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true
        bookingIdLbl.anchorWithConstantsToTop(top: bookingIdView.topAnchor, left: bookingIdView.leftAnchor, bottom: bookingIdView.bottomAnchor, right: bookingIdView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        bookingDateView.anchorWithConstantsToTop(top: topAnchor, left: bookingIdView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 16, rightConstant: 16)
        bookingDateView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true
        bookingDateLbl.anchorWithConstantsToTop(top: bookingDateView.topAnchor, left: bookingDateView.leftAnchor, bottom: bookingDateView.bottomAnchor, right: bookingDateView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        reservationDateView.anchorWithConstantsToTop(top: bookingIdView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        reservationDateView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2).isActive = true


        pointsEarnView.anchorWithConstantsToTop(top: reservationDateView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        pointsEarnView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true
        pointsEarnLbl.anchorWithConstantsToTop(top: pointsEarnView.topAnchor, left: pointsEarnView.leftAnchor, bottom: pointsEarnView.bottomAnchor, right: pointsEarnView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        conditionButton.anchorWithConstantsToTop(top: pointsEarnView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        conditionButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true

    }

    func convertAttributeString(firstString: String, secondString: String) -> NSMutableAttributedString{
        let convertedString =  NSMutableAttributedString(string: firstString, attributes: [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)] )
        convertedString.append(NSMutableAttributedString(string: secondString, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)]))
        return convertedString
    }



}





extension MyAccountActivityFilterCell{

    //MARK: Add views

    func addViews(){

        let cardView = CardView()
        addSubview(cardView)

        cardView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true
        cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true

        let filterLabel =  UILabel()
        filterLabel.text = "Filter Your Bookings"
        filterLabel.font = UIFont.boldSystemFont(ofSize: 15)

        addSubview(filterLabel)
        filterLabel.anchorWithConstantsToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right:nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        filterLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.5).isActive = true


        cardView.addSubview(filterBtn)
        filterBtn.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.5).isActive = true
        filterBtn.widthAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.5).isActive = true
        filterBtn.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        filterBtn.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true

    }
}



