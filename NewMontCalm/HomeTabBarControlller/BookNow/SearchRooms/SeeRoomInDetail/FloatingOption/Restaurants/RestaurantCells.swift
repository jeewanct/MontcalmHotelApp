//
//  RestaurantCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {


    var restaurantDetails: RestarurantHotelBars?{

        didSet{
            offerLabel.text = restaurantDetails?.name
            offerDescLabel.text = restaurantDetails?.shortDesc
            longDescription = restaurantDetails?.longDesc

            if let imageUrl = restaurantDetails?.imageUrl, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }

        }
    }

    var meetingDetails: MeetingEventsHotelDetails?{

        didSet{
            offerLabel.text = meetingDetails?.name
            offerDescLabel.text = meetingDetails?.shortDesc
            longDescription = meetingDetails?.longDesc
            if let imageUrl = meetingDetails?.imageUrl, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }

        }
    }

    var packageDetails: PackagesDetails?{

        didSet{
            offerLabel.text = packageDetails?.name
            offerDescLabel.text = packageDetails?.shortDesc
            longDescription = packageDetails?.longDesc
            if let imageUrl = packageDetails?.imageUrl, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }

        }
    }



    




    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addViews(){

        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true

        let blackView = BlackView()
        backgroundImage.addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)

        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

        addSubview(offerLabel)
        offerLabel.anchorWithConstantsToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        addSubview(offerDescLabel)
        offerDescLabel.anchorWithConstantsToTop(top: offerLabel.bottomAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


    }

    @objc func handleKnowMore(){
        if let window = UIApplication.shared.keyWindow{

            guard let knowMoreDetail = longDescription else{
                return
            }

            let obj = CustomPopUpViews()
            obj.webView.loadHTMLString(knowMoreDetail, baseURL: nil)
            window.addSubview(obj)
            obj.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)

        }

    }



    var longDescription: String?

    let offerLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        //        lbl.adjustsFontSizeToFitWidth = true
        //        lbl.minimumScaleFactor = 0.1
        lbl.text = "Meetings"
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
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

    lazy var knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 15)
        btn.setTitle("KNOW MORE", for: .normal)
        btn.addTarget(self, action: #selector(handleKnowMore), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

}
