//
//  RestaurantCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class FloatingOffersCell: UITableViewCell {


    var offersDetails: OffersTabBarHotelOffers?{
        didSet{
            offerLabel.text = offersDetails?.offerName
            offerDescLabel.text = offersDetails?.shortDesc

            if let imageUrl = offersDetails?.offerImageUrl, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }

        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        addViews()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addViews(){


        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true



        cardView.addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)

        let blackView  = BlackView()
        backgroundImage.addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)

        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        knowMoreButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 32)/2).isActive = true

        addSubview(bookNowButton)
        bookNowButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: knowMoreButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 16)


        addSubview(offerLabel)
        offerLabel.anchorWithConstantsToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        addSubview(offerDescLabel)
        offerDescLabel.anchorWithConstantsToTop(top: offerLabel.bottomAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

    }


    @objc func handleKnowMore(){
        if let window = UIApplication.shared.keyWindow{

            guard let knowMoreDetail = offersDetails?.longDesc else{
                return
            }

            let obj = CustomPopUpViews()
            obj.webView.loadHTMLString(knowMoreDetail, baseURL: nil)
            window.addSubview(obj)
            obj.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)

        }

    }

    let offerLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.text = "Offer 1"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()

    let offerDescLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 3
        //        lbl.adjustsFontSizeToFitWidth = true
        //        lbl.minimumScaleFactor = 0.1
        lbl.text = "The Montcalm London Marble Arch is the process for converting"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()


    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var bookNowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("BOOK NOW", for: .normal)
        //btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("KNOW MORE", for: .normal)
        btn.addTarget(self, action: #selector(handleKnowMore), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

}

