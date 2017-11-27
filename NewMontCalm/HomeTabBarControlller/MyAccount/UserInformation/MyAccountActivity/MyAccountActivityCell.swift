//
//  MyAccountActivityCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class MyAccountActivityCell: UICollectionViewCell {

    var parentInstance: MyAccountActivityController?


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
    
    }
    
    func addViews(){
        
        addSubview(contentTableView)
        contentTableView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        

    }
    

    lazy var contentTableView: UITableView = {
       let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tv.register(UpcomingBookingCell.self, forCellReuseIdentifier: "UpcomingBookingCell")
        return tv
    }()
    
    
    
}


class UpcomingBookingCell: UITableViewCell{

    var parentInstance: MyAccountActivityController?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    func addViews(){
        
        let tempViews = whiteViews(color: .gray)
        
        addSubview(tempViews)
        addSubview(bookingNumberLabel)
        
        
        
        
        tempViews.centerYAnchor.constraint(equalTo: bookingNumberLabel.centerYAnchor).isActive = true
        tempViews.heightAnchor.constraint(equalToConstant: 1).isActive = true
        tempViews.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        tempViews.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        
        
        bookingNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookingNumberLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        bookingNumberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        bookingNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        
        
        
        addSubview(bookingIdButton)
        addSubview(bookingDateButton)
        addSubview(reservationPeriodButton)
        
        bookingIdButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        bookingIdButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.23).isActive = true
        bookingIdButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        bookingIdButton.topAnchor.constraint(equalTo: bookingNumberLabel.bottomAnchor, constant: 16).isActive = true
        
        
        bookingDateButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true
        bookingDateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.23).isActive = true
        bookingDateButton.leftAnchor.constraint(equalTo: bookingIdButton.rightAnchor, constant: 8).isActive = true
        bookingDateButton.topAnchor.constraint(equalTo: bookingNumberLabel.bottomAnchor, constant: 16).isActive = true
        
        
       reservationPeriodButton.anchorWithConstantsToTop(top: bookingIdButton.bottomAnchor
        , left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        
        
        
        let bookingIdLabel = tempLabels(title: "Booking ID:")
        let bookingDateLabel = tempLabels(title: "Booking Date:")
        let reservationLabel = tempLabels(title: "Reservation Period:")
        
        
        bookingIdButton.addSubview(bookingIdLabel)
        bookingIdLabel.anchorWithConstantsToTop(top: bookingIdButton.topAnchor, left: bookingIdButton.leftAnchor, bottom: nil, right: bookingIdButton.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8)
        bookingIdLabel.heightAnchor.constraint(equalTo: bookingIdButton.heightAnchor, multiplier: 0.4).isActive = true
        
        bookingDateButton.addSubview(bookingDateLabel)
        bookingDateLabel.anchorWithConstantsToTop(top: bookingDateButton.topAnchor, left: bookingDateButton.leftAnchor, bottom: nil, right: bookingDateButton.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8)
        bookingDateLabel.heightAnchor.constraint(equalTo: bookingDateButton.heightAnchor, multiplier: 0.4).isActive = true
        
        reservationPeriodButton.addSubview(reservationLabel)
        reservationLabel.anchorWithConstantsToTop(top: reservationPeriodButton.topAnchor, left: reservationPeriodButton.leftAnchor, bottom: nil, right: reservationPeriodButton.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8)
        reservationLabel.heightAnchor.constraint(equalTo: reservationPeriodButton.heightAnchor, multiplier: 0.13).isActive = true
        
        
        bookingIdButton.addSubview(bookingId)
        bookingDateButton.addSubview(bookingDate)

        bookingId.anchorWithConstantsToTop(top: bookingIdLabel.bottomAnchor, left: bookingIdButton.leftAnchor, bottom: bookingIdButton.bottomAnchor, right: bookingIdButton.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8)

        
        bookingDate.anchorWithConstantsToTop(top: bookingDateLabel.bottomAnchor, left: bookingDateButton.leftAnchor, bottom: bookingDateButton.bottomAnchor, right: bookingDateButton.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8)

        
        
    }
    
    func whiteViews(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
    func tempLabels(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = title
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bookingNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Booking One"
        lbl.minimumScaleFactor = 0.1
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        lbl.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        return lbl
    }()
    
    let bookingIdButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    let bookingDateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    let reservationPeriodButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    let bookingId: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "adelonumon1939"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        return lbl
    }()
    
    let bookingDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "26/10/2017"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        return lbl
    }()
    
    
    
    
    
    
    let checkInDate: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 20)
        lbl.text = "MON\nSep '17"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let checkInYearLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.text = "22"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.32
        lbl.sizeToFit()
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 120)
        return lbl
    }()
    
    let checkOutYearLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.text = "22"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.32
        lbl.sizeToFit()
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 120)
        return lbl
    }()
    
    let checkOutDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.text = "MON\nSep '17"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.sizeToFit()
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 20)
        return lbl
    }()
    
    let checkInDay : UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .scaleAspectFill
        lbl.clipsToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 60)
        lbl.text = "22"
        return lbl
    }()
    
}




