//
//  HotelDetailsView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class HotelDetailsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
    }

    func addSubViews(){
        addSubview(hotelImage)
        hotelImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        let blackView = BlackView()
        addSubview(blackView)
        blackView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        addSubview(imageHeading)
        imageHeading.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: imageHeading.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        locationButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65).isActive = true
        locationButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true




        addSubview(viewGalleryButton)
        viewGalleryButton.anchorWithConstantsToTop(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        viewGalleryButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
        viewGalleryButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true


        addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: viewGalleryButton.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        uberButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        uberButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true

        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 0)
        callButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        callButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true

        addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: nil, left: callButton.rightAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 0)
        whatsAppButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        whatsAppButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true





    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "tempHotel")
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

    lazy var viewGalleryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View Gallery", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .right
        //     btn.imageView?.contentMode = .
        return btn

    }()
    
}
