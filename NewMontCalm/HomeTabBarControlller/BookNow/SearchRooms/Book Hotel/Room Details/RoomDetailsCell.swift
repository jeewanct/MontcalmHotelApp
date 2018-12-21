//
//  RoomDetailsCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class FacilitesCollectionCell: UICollectionViewCell  {


    var aminityImage: String?{

        didSet{
            if let imageUrl =  aminityImage, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }
        }

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)

        let blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)

        addSubview(blackView)
        blackView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)

        addSubview(aminityLabel)
        aminityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aminityLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         aminityLabel.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

    }
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

    let aminityLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "TV Channels"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
}

class RoomDetailsCell: UITableViewCell {


    var roomData: RoomDetailModel?{

        didSet{
            roomName.text = roomData?.roomName
            paragraph.text = roomData?.desc
            facilitiesCollectionView.reloadData()
            if let imageUrl =  roomData?.roomImage, let imageUrlRequest = URL(string: imageUrl){
                roomImage.pin_updateWithProgress = true
                roomImage.pin_setImage(from: imageUrlRequest)
            }
        }

    }

    var roomDetailsInstance: RoomDetails?
    var heightConstraintParagraphView: NSLayoutConstraint?


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    override func draw(_ rect: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = paragraph.bounds
        gradientLayer.locations = [0.5, 1]
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2778253425).cgColor, #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor]
        paragraph.layer.addSublayer(gradientLayer)
    }
    
    func addViews(){


        addSubview(roomImage)
        roomImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        roomImage.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

        let blackView = BlackView()
        addSubview(blackView)
        blackView.anchorToTop(top: roomImage.topAnchor, left: roomImage.leftAnchor, bottom: roomImage.bottomAnchor, right: roomImage.rightAnchor)

        addSubview(roomName)
        roomName.anchorWithConstantsToTop(top: roomImage.topAnchor, left: roomImage.leftAnchor, bottom: nil, right: roomImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 8, rightConstant: 16)


        addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: roomName.bottomAnchor, left: roomImage.leftAnchor, bottom: nil, right: roomImage.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)




        let titleView = CardView()
        addSubview(titleView)


        titleView.anchorWithConstantsToTop(top: roomImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        heightConstraintParagraphView = titleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        heightConstraintParagraphView?.isActive = true
        

        titleView.addSubview(paragraphTitle)
        paragraphTitle.anchorWithConstantsToTop(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: nil, right: titleView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        paragraphTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true


        titleView.addSubview(paragraph)
        paragraph.anchorWithConstantsToTop(top: paragraphTitle.bottomAnchor, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: UIScreen.main.bounds.height * 0.3 * 0.2 + 16, rightConstant: 16)

        titleView.addSubview(readMoreButton)
        readMoreButton.anchorToTop(top: nil, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor)
        readMoreButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3 * 0.2).isActive = true


        
        addSubview(facilitiesCollectionView)
        facilitiesCollectionView.anchorWithConstantsToTop(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        facilitiesCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 16)/2).isActive = true


        let dateView = CheckInCheckOutView()
        addSubview(dateView)
        dateView.anchorWithConstantsToTop(top: facilitiesCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.6).isActive = true


        addSubview(roomsButton)
        roomsButton.anchorWithConstantsToTop(top: dateView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        roomsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        roomsButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/2).isActive = true

        addSubview(daysButton)
        daysButton.anchorWithConstantsToTop(top: dateView.bottomAnchor, left: roomsButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 16, rightConstant: 16)
        daysButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true



    }


    @objc func handleReadMore(){


        if readMoreButton.title(for: .normal) == "READ MORE"{


            if let paragraphText = roomData?.desc {
                let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
                let estimatedFrame = NSString(string: paragraphText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "LATO-REGULAR", size: 13) ], context: nil)
                roomDetailsInstance?.contentTable.beginUpdates()
                heightConstraintParagraphView?.constant = estimatedFrame.height + UIScreen.main.bounds.height * 0.3 * 0.2  + 68
                readMoreButton.setTitle("READ LESS", for: .normal)
                roomDetailsInstance?.contentTable.endUpdates()

            }
        }else{

            roomDetailsInstance?.contentTable.beginUpdates()
            heightConstraintParagraphView?.constant = UIScreen.main.bounds.height * 0.3
            readMoreButton.setTitle("READ MORE", for: .normal)
            roomDetailsInstance?.contentTable.endUpdates()

        }

    }

    let roomImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let roomName: UILabel = {
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

    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
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
        lbl.font =  UIFont(name: "LATO-REGULAR", size: 13)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var readMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("READ MORE", for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
         btn.addTarget(self, action: #selector(handleReadMore), for: .touchUpInside)
        return btn
    }()
    
    lazy var facilitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(FacilitesCollectionCell.self, forCellWithReuseIdentifier: "FacilitesCollectionCell")
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    let roomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitle("3 Rooms", for: .normal)
        return btn
    }()

    let daysButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitle("7 Days", for: .normal)
        return btn
    }()
    
    
    
}
