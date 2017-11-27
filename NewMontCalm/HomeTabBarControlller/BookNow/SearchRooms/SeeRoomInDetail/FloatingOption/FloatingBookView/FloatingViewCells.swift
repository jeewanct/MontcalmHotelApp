//
//  FloatingViewCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


class BookNowInformationCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR

    }

    override func draw(_ rect: CGRect) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = paragraph.bounds
        gradientLayer.locations = [0.3, 0.7]
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2778253425).cgColor, #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor]
        paragraph.layer.addSublayer(gradientLayer)
    }

    func addViews(){
        addSubview(imageCollectionView)
        imageCollectionView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        imageCollectionView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true


        let titleView = UIView()
        titleView.backgroundColor = .white
        titleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleView)
        titleView.anchorWithConstantsToTop(top: imageCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        titleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true




        titleView.addSubview(paragraphTitle)
        paragraphTitle.anchorWithConstantsToTop(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: nil, right: titleView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        titleView.addSubview(paragraph)
        paragraph.anchorWithConstantsToTop(top: paragraphTitle.bottomAnchor, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        titleView.addSubview(readMoreButton)
        readMoreButton.anchorToTop(top: nil, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor)
        readMoreButton.heightAnchor.constraint(equalTo: titleView.heightAnchor, multiplier: 0.2).isActive = true


        addSubview(hotelFacilities)
        hotelFacilities.anchorWithConstantsToTop(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        hotelFacilities.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        addSubview(roomTypesButton)
        roomTypesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        roomTypesButton.anchorWithConstantsToTop(top: hotelFacilities.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCollectionViewCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    let paragraphTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Paragraph Title"
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()

    let paragraph: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "The most notable changes in iOS 11 overall are back-end enhancements and an improved voice for Siri, plus Apple Pay and Photos services enhancements. The Do Not Disturb While Driving feature was introduced during the second beta. The ninth beta of iOS 11 has build number 15A5370a, with the previous holding number 15A5368a —a very small increment since Monday's update"
        lbl.font = UIFont(name: "LATO-REGULAR", size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()

    let readMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("READ MORE", for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        return btn
    }()

    lazy var hotelFacilities: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = false
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor  = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        cv.register(FacilityCell.self, forCellWithReuseIdentifier: "FacilityCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()


    let roomTypesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("ROOM TYPES", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()


}


class FacilityCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

   

    func addViews(){

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Appearance.SECONDARYCOLOR

        addSubview(view)
        view.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)

        view.addSubview(facilityLabel)
        facilityLabel.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let facilityLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.text = "Room Ammenities"

        return lbl
    }()




}


class BookNowHotelListingCell: UITableViewCell{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }

    func addViews(){
        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()
}
