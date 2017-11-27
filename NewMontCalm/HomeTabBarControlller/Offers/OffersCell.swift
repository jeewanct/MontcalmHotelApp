//
//  OffersCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class OffersCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(hotelName)

        hotelName.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        hotelName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        addSubview(offersCollectionView)
        offersCollectionView.anchorToTop(top: hotelName.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    lazy var offersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        cv.register(OffersViewCell.self, forCellWithReuseIdentifier: "OffersInDetail")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let hotelName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.text = "Mont Calm"
        return lbl
    }()
}


class OffersViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(exploreImage)
        exploreImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        //exploreImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        exploreImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.alpha = 0.5
        exploreImage.addSubview(effectView)
        effectView.anchorToTop(top: exploreImage.topAnchor, left: exploreImage.leftAnchor, bottom: exploreImage.bottomAnchor, right: exploreImage.rightAnchor)
        
        exploreImage.addSubview(imageHeading)
        imageHeading.centerXAnchor.constraint(equalTo: exploreImage.centerXAnchor).isActive = true
        imageHeading.centerYAnchor.constraint(equalTo: exploreImage.centerYAnchor).isActive = true
        
        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        //knowMoreButton.anchorToTop(top: exploreImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil)
        knowMoreButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(bookNowButton)
        bookNowButton.anchorWithConstantsToTop(top: exploreImage.bottomAnchor, left: knowMoreButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8)
       // bookNowButton.anchorToTop(top: exploreImage.bottomAnchor, left: knowMoreButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor)
        
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
        lbl.text = "Demo"
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 20)
        return lbl
    }()
    
    lazy var bookNowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
        btn.setTitle("BOOK NOW", for: .normal)
        // btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    lazy var knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
        btn.setTitle("KNOW MORE", for: .normal)
        //btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
}
