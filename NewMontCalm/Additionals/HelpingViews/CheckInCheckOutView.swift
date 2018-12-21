//
//  CheckInCheckOutView.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 03/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

protocol OpenCalendar {
    
    func openCalendar(value: Int)
    
}


class CheckInCheckOutView: UIView {
    
    var delegate: OpenCalendar?
    var checkIn: Date?{
        didSet{
            self.setCheckInDate()
            
        }
    }
    
    var checkOut: Date?{
        didSet{
            self.setCheckOutDate()
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(checkInButton)
        addSubview(checkOutButton)
        
        checkInButton.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil)
        checkInButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        
        checkOutButton.anchorWithConstantsToTop(top: topAnchor, left: checkInButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0)
        
        let checkInLabel = tempLabels(title: "Check In")
        let checkOutLabel = tempLabels(title: "Check Out")
        
        checkInButton.addSubview(checkInLabel)
        checkOutButton.addSubview(checkOutLabel)
        
        
        checkInLabel.anchorWithConstantsToTop(top: checkInButton.topAnchor, left: checkInButton.leftAnchor, bottom: nil, right: checkInButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkInLabel.heightAnchor.constraint(equalTo: checkInButton.heightAnchor, multiplier: 0.1).isActive = true
        
        checkOutLabel.anchorWithConstantsToTop(top: checkOutButton.topAnchor, left: checkOutButton.leftAnchor, bottom: nil, right: checkOutButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        checkOutLabel.heightAnchor.constraint(equalTo: checkOutButton.heightAnchor, multiplier: 0.1).isActive = true
        
        checkInButton.addSubview(checkInDate)
        checkInDate.anchorWithConstantsToTop(top: checkInLabel.bottomAnchor, left: checkInButton.leftAnchor, bottom: checkInButton.bottomAnchor, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 16, rightConstant: 0)
        checkInDate.widthAnchor.constraint(equalTo: checkInButton.widthAnchor, multiplier: 0.4).isActive = true
        
        checkInButton.addSubview(checkInYearLabel)
        checkInYearLabel.anchorWithConstantsToTop(top: checkInLabel.bottomAnchor, left: checkInDate.rightAnchor, bottom: checkInButton.bottomAnchor, right: checkInButton.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 16, rightConstant: 16)
        
        
        checkOutButton.addSubview(checkOutDate)
        checkOutDate.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: checkOutButton.leftAnchor, bottom: checkOutButton.bottomAnchor, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 16, rightConstant: 0)
        checkOutDate.widthAnchor.constraint(equalTo: checkOutButton.widthAnchor, multiplier: 0.4).isActive = true
        
        checkOutButton.addSubview(checkOutYearLabel)
        checkOutYearLabel.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: checkOutDate.rightAnchor, bottom: checkOutButton.bottomAnchor, right: checkOutButton.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 16, rightConstant: 16)
    
        
    }
    
    @objc func handleCheckInCheckIn(){
        delegate?.openCalendar(value: 1)
        
    }
    
    
    @objc func handleCheckInCheckOut(){
        delegate?.openCalendar(value: 2)
    }
    
    
   
    
    func tempLabels(title: String) -> UILabel {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: lbl.font.fontName, size: 12)
        lbl.text = title
        return lbl
    }
    
    
    
    lazy var checkInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(handleCheckInCheckIn), for: .touchUpInside)
        return btn
    }()
    
    lazy var checkOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(handleCheckInCheckOut), for: .touchUpInside)
        return btn
    }()
    
    let checkInDate: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: lbl.font.fontName, size: 20)
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
        lbl.font = UIFont(name: lbl.font.fontName, size: 120)//UIFont.boldSystemFont(ofSize: 120)
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
        lbl.font = UIFont(name: lbl.font.fontName, size: 120)//UIFont.boldSystemFont(ofSize: 120)
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
        lbl.font = UIFont(name: lbl.font.fontName, size: 20) //UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
}


extension CheckInCheckOutView{
    
    
    func setCheckInDate(){
        
        if let getCheckInDate = checkIn{
            
            let checkInDay = LogicHelper.shared.getMonth(date: getCheckInDate)
            let weekName = LogicHelper.shared.getDayName(date: getCheckInDate)
            let checkInYear = LogicHelper.shared.getYear(date: getCheckInDate)
            let checkedInDate  = LogicHelper.shared.getDate(date: getCheckInDate)
            
            checkInDate.text = "\(weekName)\n\(checkInDay) '\(checkInYear)"
            checkInYearLabel.text = checkedInDate
        }
        
    }
    
    func setCheckOutDate(){
        
        if let getCheckOutDate = checkOut{
            
            let checkOutDay = LogicHelper.shared.getMonth(date: getCheckOutDate)
            let weekName = LogicHelper.shared.getDayName(date: getCheckOutDate)
            let checkOutYear = LogicHelper.shared.getYear(date: getCheckOutDate)
            let checkedOutDate  = LogicHelper.shared.getDate(date: getCheckOutDate)
            
            
            checkOutDate.text = "\(weekName)\n\(checkOutDay) '\(checkOutYear)"
            checkOutYearLabel.text = checkedOutDate
            
        }
        
    }
    
    
}
