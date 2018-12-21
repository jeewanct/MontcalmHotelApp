//
//  OffersCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ExploreSelectionCell: UITableViewCell {

    var hotelNameString: String?{
        didSet{
            hotelName.text = hotelNameString
            offersCollectionView.reloadData()
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addViews()
        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews(){
        addSubview(hotelName)

        hotelName.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8
        )
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
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(ExploreSelectionCollectionCell.self, forCellWithReuseIdentifier: "ExploreSelectionCollectionCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    let hotelName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.text = "Mont Calm"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
}


class ExploreSelectionCollectionCell: UICollectionViewCell {


    var offerHeadingString: String?{
        didSet{
            offerHeading.text = offerHeadingString
        }
    }
    
    var offerImageString: String?{
        didSet{
            
            if let imageUrl = offerImageString, let imageUrlRequest = URL(string: imageUrl){
                offerImage.pin_updateWithProgress = true
                offerImage.pin_setImage(from: imageUrlRequest)
            }
        }
    }
    
    var knowMoreString: String?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews(){

        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true

        addSubview(offerImage)
        offerImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        //exploreImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        offerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true

        let blackView = BlackView()
        offerImage.addSubview(blackView)
        blackView.anchorToTop(top: offerImage.topAnchor, left: offerImage.leftAnchor, bottom: offerImage.bottomAnchor, right: offerImage.rightAnchor)

        offerImage.addSubview(offerHeading)
        offerHeading.anchorWithConstantsToTop(top: nil, left: offerImage.leftAnchor, bottom: nil, right: offerImage.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        offerHeading.centerXAnchor.constraint(equalTo: offerImage.centerXAnchor).isActive = true
        offerHeading.centerYAnchor.constraint(equalTo: offerImage.centerYAnchor).isActive = true


        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: offerImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
    }

    
    @objc func handleKnowMore(){
        
        if let window = UIApplication.shared.keyWindow{
            
            guard let knowMoreDetail = knowMoreString else{
                return
            }
            
            let obj = CustomPopUpViews()
            obj.webView.loadHTMLString(knowMoreDetail, baseURL: nil)
            window.addSubview(obj)
            obj.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
            
        }
    }

    let offerImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let offerHeading: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.text = "Demo"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()


    lazy var knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 14)
        btn.setTitle("KNOW MORE", for: .normal)
        btn.addTarget(self, action: #selector(handleKnowMore), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


}

