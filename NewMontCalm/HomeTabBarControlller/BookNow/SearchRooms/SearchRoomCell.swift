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
    var hotelList: RoomList? {
        didSet{
            hotelNameText.text = hotelList?.hotelName

            guard let imagePath = hotelList?.hotelImage else {
                return
            }
            
            backgroundImage.downloadImage(imagePath: imagePath)
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
        searchRoomInstance?.bookNow()
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
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var uberButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Book an Uber", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        /// btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)
        // btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        //btn.backgroundColor = .white
        btn.contentHorizontalAlignment = .left
        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn

    }()

    lazy var callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("020 5482 5267", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.imageView?.contentMode = .scaleAspectFit
        return btn

    }()


    lazy var whatsAppButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("07258454834", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        //     btn.imageView?.contentMode = .
        return btn

    }()
    
//    lazy var callButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
//        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        btn.setTitle("CALL", for: .normal)
//       // btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
//        btn.addTarget(self, action: #selector(handleCall), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//
//    let uberButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
//        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        btn.setTitle("UBER", for: .normal)
//       // btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//
//    lazy var bookNowButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
//        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        btn.setTitle("BOOK NOW", for: .normal)
//       // btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
//        btn.titleLabel?.numberOfLines = 1
//        btn.titleLabel?.adjustsFontSizeToFitWidth = true
//        btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()

    let hotelNameText: UILabel = {
        let lbl = UILabel()
        lbl.text = "The Montcalm London Marble Arch"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()

    lazy var distanceButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("10 Miles Away", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.imageView?.contentMode = .scaleAspectFit
        return btn

    }()


    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("40 London Road London", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        //     btn.imageView?.contentMode = .
        return btn

    }()


    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()

    let starRatingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Star Rating ★★★★★"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()
    
}
