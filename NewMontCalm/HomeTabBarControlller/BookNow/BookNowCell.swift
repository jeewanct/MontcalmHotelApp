//
//  BookNowCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 04/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    
    var moveCollectinView = 0
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setup()
    //    animateHotelCollection()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    }

    func animateHotelCollection(){
        UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {


            self.ourPropertiesCollectionView.scrollToItem(at: IndexPath(item: self.moveCollectinView, section: 0), at: .left, animated: true)
             self.moveCollectinView = self.moveCollectinView < 9 ? self.moveCollectinView + 1 : 0
        }) { (value) in
            self.animateHotelCollection()
        }
    }

    func setup(){
        promoText.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var bookNowInstance: BookNow?
    
    
    @objc func searchRooms(){
        bookNowInstance?.handleSearchRooms()
    }
    
    @objc func handleLogin(){
        bookNowInstance?.handleLoginRegister()
    }

    @objc func handleCheckInOut(){
        bookNowInstance?.goToCalendar()
    }
    // MARK: UI Elements
    let allHotelsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("All Montcalm Hotels", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var checkInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCheckInOut), for: .touchUpInside)
        return btn
    }()


    lazy var checkOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCheckInOut), for: .touchUpInside)
        return btn
    }()
    
    let promoText: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        txt.placeholder = "Enter Promo Code"
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 10))
        txt.leftView = leftPadding
        txt.leftViewMode = .always
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var searchRoomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("SEARCH ROOMS", for: .normal)
        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


    lazy var selectCurrency: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("Select Currency", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
       // btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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


    //MARK: CHANGES BY CLIENT

    lazy var whyBookHereButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("WHY BOOK HERE", for: .normal)
      //  btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    lazy var ourPropertiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.tag = 0
        cv.showsHorizontalScrollIndicator = false
        cv.register(OurPropertiesCell.self, forCellWithReuseIdentifier: "OurPropertiesCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()


    lazy var termAndConditionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 12)
        btn.setTitle("TERM & CONDITIONS", for: .normal)
     //   btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


    lazy var privacyStatmentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 12)
        btn.setTitle("PRIVACY STATEMENT", for: .normal)
    //    btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


}



class OurPropertiesCell: UICollectionViewCell{

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    func addViews(){
        addSubview(backgroundImageView)
        backgroundImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()


}

