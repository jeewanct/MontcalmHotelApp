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

        addSubview(hotelName)
        hotelName.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 8, rightConstant: 16)


        let locationImage = hotelName.buttonIcons(image: #imageLiteral(resourceName: "marker"))
        addSubview(locationImage)

        addSubview(locationButton)
        locationButton.anchorWithConstantsToTop(top: hotelName.bottomAnchor, left: locationImage.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 4, bottomConstant: 8, rightConstant: 16)
        locationButton.widthAnchor.constraint(equalTo: hotelName.widthAnchor, multiplier: 0.7).isActive = true


        locationImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationImage.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        locationImage.leftAnchor.constraint(equalTo: hotelImage.leftAnchor, constant: 16).isActive = true



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

    let hotelName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        //        lbl.adjustsFontSizeToFitWidth = true
        //        lbl.minimumScaleFactor = 0.1
        lbl.text = "The Montcalm London Marble Arch"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()



    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("40 London Road, London,AB1 CD2", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)

        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.numberOfLines = 0

        return btn

    }()


    
}
