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
    let dateView = CheckInCheckOutView()
    var currencySearchResult: [GetCurrency]?
    var currencyList: [GetCurrency]?{
        didSet{
            currencySearchResult = currencyList
        }
    }
    
    let currencyView = CurrencyView()

    var hotelSearchResult: [ListOfAvailableHotels]?

    var hotelList: [ListOfAvailableHotels]?{
        didSet{
            DispatchQueue.main.async {
                     self.changeCollectinViewHeight()
                     self.ourPropertiesCollectionView.reloadData()
            }
            
            hotelSearchResult = hotelList
        }
    }
    
    var buttonValue = 0
    var collectionHeightAnchor: NSLayoutConstraint?
    
    var homeData: HomeContactModel?{
        didSet{
            hotelList = homeData?.hotelList
            changeCollectinViewHeight()
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setup()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        selectionStyle = .none
    }

    func animateHotelCollection(){
        UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {


            self.ourPropertiesCollectionView.scrollToItem(at: IndexPath(item: self.moveCollectinView, section: 0), at: .left, animated: true)
             self.moveCollectinView = self.moveCollectinView < 9 ? self.moveCollectinView + 1 : 0
        }) { (value) in
            self.animateHotelCollection()
        }
    }
    
    func changeCollectinViewHeight(){
        
        if let hotelListCount = hotelList?.count{
            if hotelListCount > 0 {
                if let getString = hotelList?[0].hotelName{
                   
                    let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
                        
                        let estimatedFrame = NSString(string: getString).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15) ], context: nil)
                       collectionHeightAnchor?.constant =  estimatedFrame.height * 2 + 72 + estimatedFrame.height * 0.5 * 2 + Constants.StandardSize.TABLEROWHEIGHT
                    
                }
            }
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

    @objc func handleCurrency(){

        if let window = UIApplication.shared.keyWindow{
            buttonValue = 1
            window.addSubview(currencyView)
            currencyView.contentTable.delegate = self
            currencyView.contentTable.dataSource = self
            currencyView.searchBar.delegate = self
          //  currencyView.currencyList = currencyList
            currencyView.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        }
    }
    
    @objc func handleHotels(){
        
        if let window = UIApplication.shared.keyWindow{
            buttonValue = 0
            let currencyView = CurrencyView()
            currencyView.contentTable.delegate = self
            currencyView.contentTable.dataSource = self
            currencyView.searchBar.delegate = self
            window.addSubview(currencyView)
         //   currencyView.currencyList = currencyList
            currencyView.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        }
    }

    // MARK: UI Elements
    lazy var allHotelsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleLabel?.font  = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitle("All Montcalm Hotels", for: .normal)
        btn.addTarget(self, action: #selector(handleHotels), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
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
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitle("SEARCH ROOMS", for: .normal)
        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


    lazy var selectCurrency: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font  = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitle("Select Currency", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(handleCurrency), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


    //MARK: CHANGES BY CLIENT

    lazy var whyBookHereButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font  = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitle("WHY BOOK HERE", for: .normal)
        btn.addTarget(self, action: #selector(handlePrivacyStatments), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    lazy var ourPropertiesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.tag = 0
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(OurPropertiesCell.self, forCellWithReuseIdentifier: "OurPropertiesCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()


    lazy var termAndConditionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 12)
        btn.setTitle("TERM & CONDITIONS", for: .normal)
        btn.addTarget(self, action: #selector(handlePrivacyStatments), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        btn.contentVerticalAlignment = .center
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        return btn
    }()


    lazy var privacyStatmentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 12)
        btn.setTitle("PRIVACY STATEMENT", for: .normal)
        btn.addTarget(self, action: #selector(handlePrivacyStatments), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        btn.contentVerticalAlignment = .center
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        return btn
    }()


}



class OurPropertiesCell: UICollectionViewCell{

    var hotelDetail: ListOfAvailableHotels? {
        didSet{
            locationButton.setTitle(hotelDetail?.hotelAddress, for: .normal)
            callButton.setTitle(hotelDetail?.hotelTelNo, for: .normal)
            whatsAppButton.setTitle(hotelDetail?.hotelWhatsAppNo, for: .normal)
            if let startingPrice = hotelDetail?.startingPrice{
                startFromLabel.text = "Starts from \(startingPrice)"
            }
            guard let hotelName = hotelDetail?.hotelName else {
                return
            }
            if let rating = hotelDetail?.hotelRating{
                var ratingString = String()
                ratingString.append(" ")
                if let starRating = Double(rating) {
                    for _ in 1...Int(starRating){
                        ratingString.append("★")
                    }
                    hotelNameText.attributedText = hotelNameText.convertAttributeString(firstString: hotelName, secondString: ratingString, firstColor: #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), secondColor: #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1))
                    
                }
            }
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
       // contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    }

    func addViews(){
        
        addSubview(backgroundImageView)
        backgroundImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        backgroundImageView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT ).isActive = true

        addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: backgroundImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 4, rightConstant: 16 )
        
        
        let locationImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "marker"))
        addSubview(locationImage)
        
        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: locationImage.rightAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 4, bottomConstant: 16, rightConstant: 16)
        locationButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 112) / 1.5).isActive = true
        
    
        locationImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationImage.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        locationImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        

        
        let milesImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "miles"))
        addSubview(milesImage)
        
        addSubview(milesButton)
        milesButton.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: milesImage.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 4, bottomConstant: 4, rightConstant: 16)
        
        
        milesImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        milesImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        milesImage.centerYAnchor.constraint(equalTo: milesButton.centerYAnchor).isActive = true
        milesImage.leftAnchor.constraint(equalTo: locationButton.rightAnchor, constant: 8).isActive = true
        
        
        
        
        let callImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "call-answer"))
        addSubview(callImage)
        
        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: locationButton.bottomAnchor , left: callImage.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 4, bottomConstant: 4, rightConstant: 16)
        
        callButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 112) / 2).isActive = true
        
        
        callImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        callImage.centerYAnchor.constraint(equalTo: callButton.centerYAnchor).isActive = true
        callImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        
        let whatsAppImage = hotelNameText.buttonIcons(image: #imageLiteral(resourceName: "whatsapp-logo"))
        addSubview(whatsAppImage)
        
        addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: locationButton.bottomAnchor, left: whatsAppImage.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 4, bottomConstant: 4, rightConstant: 16)
        
        
        whatsAppImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        whatsAppImage.centerYAnchor.constraint(equalTo: whatsAppButton.centerYAnchor).isActive = true
        whatsAppImage.leftAnchor.constraint(equalTo: callButton.rightAnchor, constant: 8).isActive = true
        
        
        
        
        
        
        addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: callButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        
        
        
        
        
        
        

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

    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("123 Road, London, Ab1 CD 2", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
       // btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    
    lazy var milesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("10 Miles", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
       // btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        return btn
    }()
    
    
    
    
    lazy var callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("020 5482 5267", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.imageView?.contentMode = .scaleAspectFit
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        return btn
        
    }()
    
    
    lazy var whatsAppButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("07258454834", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        return btn
        
    }()
    
    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()
    
    let hotelNameText: UILabel = {
        let lbl = UILabel()
        lbl.text = "The Montcalm London Marble Arch"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        return lbl
    }()
    
   



}

