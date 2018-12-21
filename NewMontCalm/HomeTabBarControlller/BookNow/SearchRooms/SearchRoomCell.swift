//
//  SearchRoomCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SearchRoomCell: UITableViewCell{
    
    var searchRoomInstance: SearchRooms?
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

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    @objc func searchRooms(){

        if let hotelId = hotelDetail?.hotelId{
            searchRoomInstance?.bookNow(hotelId: hotelId)
        }

    }

    @objc func handleCall(){

        if let url = URL(string: "tel://\("9045152406")"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }

    }

    // MARK: UI Elements

    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("123 Road, London, Ab1 CD 2", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
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
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        return btn
    }()
    
    lazy var bookHotelButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("Book Now", for: .normal)
        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
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
    
    let starLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "★★★★★"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.minimumScaleFactor = 0.5
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        return lbl
    }()
    
}
