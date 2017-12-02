//
//  ContactsCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell{


    var hotelList: RoomList? {
        didSet{
            imageHeading.text = hotelList?.hotelName

            guard let imagePath = hotelList?.hotelImage else {
                return
            }

            exploreImage.downloadImage(imagePath: imagePath)
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let exploreImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let imageHeading: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.minimumScaleFactor = 0.1
        lbl.text = "The Montcalm London Marble Arch"
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
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

    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("40 London Road, London,AB1 CD2", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        //     btn.imageView?.contentMode = .
        return btn

    }()


    
//    lazy var uberButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
//        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
//        btn.setTitle("UBER", for: .normal)
//        // btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//    
//    
//    lazy var callButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
//        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
//        btn.setTitle("CALL", for: .normal)
//        //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
}
