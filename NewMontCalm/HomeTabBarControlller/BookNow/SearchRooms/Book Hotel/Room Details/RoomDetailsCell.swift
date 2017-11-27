//
//  RoomDetailsCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class FacilitesCollectionCell: UICollectionViewCell  {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
      //  backgroundImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()
}

class RoomDetailsCell: UITableViewCell {
    
    var roomDetailsInstance: RoomDetails?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    override func draw(_ rect: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = paragraph.bounds
        gradientLayer.locations = [0.3, 0.7]
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2778253425).cgColor, #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor]
        paragraph.layer.addSublayer(gradientLayer)
    }
    
    func addViews(){
        addSubview(hotelImage)
        hotelImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        hotelImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25).isActive = true
        
        
        let titleView = UIView()
        titleView.backgroundColor = .white
        titleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleView)
        titleView.anchorWithConstantsToTop(top: hotelImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        titleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
        


        
        titleView.addSubview(paragraphTitle)
        paragraphTitle.anchorWithConstantsToTop(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: nil, right: titleView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        titleView.addSubview(paragraph)
        paragraph.anchorWithConstantsToTop(top: paragraphTitle.bottomAnchor, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

         titleView.addSubview(readMoreButton)
        readMoreButton.anchorToTop(top: nil, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor)
        readMoreButton.heightAnchor.constraint(equalTo: titleView.heightAnchor, multiplier: 0.2).isActive = true

        
        addSubview(facilitiesCollectionView)
        facilitiesCollectionView.anchorWithConstantsToTop(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        facilitiesCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.23).isActive = true


        addSubview(checkInButton)
        checkInButton.anchorWithConstantsToTop(top: facilitiesCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 24, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        checkInButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.15).isActive = true
        checkInButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/2).isActive = true

        let checkInLabel = UILabel()
        checkInLabel.translatesAutoresizingMaskIntoConstraints = false
        checkInLabel.text = "Check In"
        checkInLabel.font = UIFont(name: "LATO-REGULAR", size: 15)
        checkInLabel.adjustsFontSizeToFitWidth = true
        checkInLabel.minimumScaleFactor = 0.4
        checkInButton.addSubview(checkInLabel)
        checkInLabel.anchorWithConstantsToTop(top: checkInButton.topAnchor, left: checkInButton.leftAnchor, bottom: nil, right: checkInButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        checkInLabel.heightAnchor.constraint(equalTo: checkInButton.heightAnchor, multiplier: 0.2).isActive = true

        checkInButton.addSubview(dayYearCheckInLabel)
        dayYearCheckInLabel.anchorWithConstantsToTop(top: checkInLabel.bottomAnchor, left: checkInButton.leftAnchor, bottom: checkInButton.bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 0)
        dayYearCheckInLabel.widthAnchor.constraint(equalTo: checkInButton.widthAnchor, multiplier: 0.4).isActive = true

        checkInButton.addSubview(checkInDateLabel)
        checkInDateLabel.anchorWithConstantsToTop(top: checkInLabel.bottomAnchor, left: dayYearCheckInLabel.rightAnchor, bottom: checkInButton.bottomAnchor, right: checkInButton.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 16, rightConstant: 16)



        addSubview(checkOutButton)
        checkOutButton.anchorWithConstantsToTop(top: facilitiesCollectionView.bottomAnchor, left: checkInButton.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        checkOutButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.15).isActive = true

        let checkOutLabel = UILabel()
        checkOutLabel.translatesAutoresizingMaskIntoConstraints = false
        checkOutLabel.text = "Check Out"
        checkOutLabel.font = UIFont(name: "LATO-REGULAR", size: 15)
        checkOutLabel.adjustsFontSizeToFitWidth = true
        checkOutLabel.minimumScaleFactor = 0.4
        checkOutButton.addSubview(checkOutLabel)
        checkOutLabel.anchorWithConstantsToTop(top: checkOutButton.topAnchor, left: checkOutButton.leftAnchor, bottom: nil, right: checkOutButton.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        checkOutLabel.heightAnchor.constraint(equalTo: checkOutButton.heightAnchor, multiplier: 0.2).isActive = true

        checkOutButton.addSubview(dayYearCheckOutLabel)
        dayYearCheckOutLabel.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: checkOutButton.leftAnchor, bottom: checkOutButton.bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 0)
        dayYearCheckOutLabel.widthAnchor.constraint(equalTo: checkOutButton.widthAnchor, multiplier: 0.4).isActive = true


        checkOutButton.addSubview(checkOutDateLabel)
        checkOutDateLabel.anchorWithConstantsToTop(top: checkOutLabel.bottomAnchor, left: dayYearCheckOutLabel.rightAnchor, bottom: checkOutButton.bottomAnchor, right: checkOutButton.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 16, rightConstant: 16)


        addSubview(roomsButton)
        roomsButton.anchorWithConstantsToTop(top: checkInButton.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        roomsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        roomsButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/2).isActive = true

        addSubview(daysButton)
        daysButton.anchorWithConstantsToTop(top: checkOutButton.bottomAnchor, left: roomsButton.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        daysButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true





    }
    let hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let paragraphTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Paragraph Title"
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()
    
    let paragraph: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "The most notable changes in iOS 11 overall are back-end enhancements and an improved voice for Siri, plus Apple Pay and Photos services enhancements. The Do Not Disturb While Driving feature was introduced during the second beta. The ninth beta of iOS 11 has build number 15A5370a, with the previous holding number 15A5368a —a very small increment since Monday's update"
        lbl.font = UIFont(name: "LATO-REGULAR", size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let readMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("READ MORE", for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        return btn
    }()
    
    lazy var facilitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(FacilitesCollectionCell.self, forCellWithReuseIdentifier: "FacilitesCollectionCell")
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    let checkInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let checkOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    let dayYearCheckInLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "MON\nSep '17"
        lbl.numberOfLines = 0
        lbl.baselineAdjustment = .alignCenters
        lbl.minimumScaleFactor = 0.1
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont(name: "LATO-REGULAR", size: 20)
        return lbl
    }()

    let checkInDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "22"
        lbl.numberOfLines = 0
        lbl.baselineAdjustment = .alignCenters
        lbl.minimumScaleFactor = 0.3
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont(name: "LATO-REGULAR", size: 60)
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()

    let checkOutDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "29"
        lbl.numberOfLines = 0
        lbl.baselineAdjustment = .alignCenters
        lbl.minimumScaleFactor = 0.3
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont(name: "LATO-REGULAR", size: 60)
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()

    let dayYearCheckOutLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "WED\nSep '17"
        lbl.baselineAdjustment = .alignCenters
        lbl.numberOfLines = 0
        lbl.minimumScaleFactor = 0.1
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont(name: "LATO-REGULAR", size: 20)
        return lbl
    }()


    let roomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitle("3 Rooms", for: .normal)
        return btn
    }()

    let daysButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitle("7 Days", for: .normal)
        return btn
    }()
    
    
    
}
