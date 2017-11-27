//
//  RestaurantCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class FloatingOffersCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        addViews()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addViews(){

        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true

        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.alpha = 0.5
        effectView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.addSubview(effectView)
        effectView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)

        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        knowMoreButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 32)/2).isActive = true

        addSubview(bookNowButton)
        bookNowButton.anchorWithConstantsToTop(top: backgroundImage.bottomAnchor, left: knowMoreButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 16)

    }

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
       // btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

}

