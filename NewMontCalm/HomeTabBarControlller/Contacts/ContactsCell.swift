//
//  ContactsCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import PINRemoteImage

class ContactsCell: UITableViewCell{


    var hotelList: ListOfAvailableHotels? {
        didSet{
            imageHeading.text = hotelList?.hotelName
            locationButton.setTitle(hotelList?.hotelAddress, for: .normal)
            whatsAppButton.setTitle(hotelList?.hotelWhatsAppNo, for: .normal)
            callButton.setTitle(hotelList?.hotelTelNo, for: .normal)
            
            if let imageUrl = hotelList?.hotelImageUrl, let imageUrlRequest = URL(string: imageUrl){
                hotelImage.pin_updateWithProgress = true
                hotelImage.pin_setImage(from: imageUrlRequest)
            }
        }
    }

    var parentInstance: Contacts?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let hotelImage: UIImageView = {
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
        lbl.numberOfLines = 0
        lbl.text = "The Montcalm London Marble Arch"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()

    

    lazy var callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("020 5482 5267", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
       // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
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
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
       // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        return btn

    }()

    

    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("40 London Road, London,AB1 CD2", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.numberOfLines = 2
        btn.addTarget(self, action: #selector(handleLocation), for: .touchUpInside)
        return btn

    }()


    

    
}
