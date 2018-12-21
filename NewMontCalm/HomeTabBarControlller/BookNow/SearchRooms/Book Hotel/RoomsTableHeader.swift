//
//  RoomsTableHeader.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class RoomsHeaderView: UITableViewHeaderFooterView{
    var cellIndex: Int?
    var bookHotelCellIndex: BookHotelNowCell?

    var roomImage: String?{

        didSet{
            if let imageUrl = roomImage, let imageUrlRequest = URL(string: imageUrl){
                hotelImage.pin_updateWithProgress = true
                hotelImage.pin_setImage(from: imageUrlRequest)
            }
        }



    }
    var roomName: String?{
        didSet{
            hotelNameText.text = roomName
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
         backgroundColor = .clear
        setup()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){

        let cardView = CardView()
        addSubview(cardView)

        cardView.addSubview(startFromLabel)

        cardView.addSubview(hotelNameText)


        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true





        hotelNameText.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        hotelNameText.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.9).isActive = true
        hotelNameText.bottomAnchor.constraint(equalTo: startFromLabel.topAnchor, constant: 0).isActive = true
        hotelNameText.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.15).isActive = true


        startFromLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        startFromLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.9).isActive = true
        startFromLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0).isActive = true
        startFromLabel.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.15).isActive = true

        cardView.addSubview(hotelImage)
        hotelImage.anchorToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor)
        hotelImage.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.65).isActive = true

    }
    
    @objc func handleTap(){
        
        
        print("tap Gesture")
        guard let index = cellIndex else { return }
        if index == bookHotelCellIndex?.cellIndex ?? -1{
            bookHotelCellIndex?.cellIndex = -1
            DispatchQueue.main.async {
                self.bookHotelCellIndex?.contentTable.reloadData()
                //self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .top )
            }
        }else{
            bookHotelCellIndex?.cellIndex = index
            
            DispatchQueue.main.async {
                
                self.bookHotelCellIndex?.contentTable.reloadData()
                // self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .bottom )
                //self.bookHotelCellIndex?.contentTable.reloadData()
            }
        }
        
    }

    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()


    
    
    let hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let hotelNameText: UILabel = {
        let lbl = UILabel()
        lbl.text = "The Montcalm London  Arch ★★★★★"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.numberOfLines = 2
        return lbl
    }()
}

import UIKit

class RateTypeHeaderView: UIView{
    var cellIndex: Int?
    var rateTypeCellIndex: RateTypeCell?
    var rateImage: String?{

        didSet{
            if let imageUrl = rateImage, let imageUrlRequest = URL(string: imageUrl){
                hotelImage.pin_updateWithProgress = true
                hotelImage.pin_setImage(from: imageUrlRequest)
            }
        }



    }
    var rateTypeName: String?{
        didSet{
            if let rateTitleString = rateTypeName{
                rateTitle.attributedText = rateTitle.convertAttributeStringWithUnderLine(firstString: rateTitleString, secondString: " Tell Me More")
            }

        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
        backgroundColor = .clear
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc func handleTap(){
        print("tap Gesture")
        guard let index = cellIndex else { return }
        if index == rateTypeCellIndex?.cellIndex ?? -1 {
            rateTypeCellIndex?.cellIndex = -1
            DispatchQueue.main.async {

                //self.rateTypeCellIndex?.contentTable.
                self.rateTypeCellIndex?.contentTable.reloadData()
                //self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .top )
                



            }
        }else{
            rateTypeCellIndex?.cellIndex = index

            DispatchQueue.main.async {

                self.rateTypeCellIndex?.contentTable.reloadData()
                // self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .bottom )
                //self.bookHotelCellIndex?.contentTable.reloadData()
            }
        }



    }

    func addViews(){

        rateTitle.attributedText = rateTitle.convertAttributeStringWithUnderLine(firstString: "Limited Offer - Get 5% Off - ", secondString: "Tell Me More")
        let cardView = CardView()


        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

        cardView.addSubview(rateTitle)
        rateTitle.anchorWithConstantsToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: UIScreen.main.bounds.height * 0.07 * 2 * 0.3 + 8)
        rateTitle.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true


        let nextImage = UIImageView()
        nextImage.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)
        nextImage.translatesAutoresizingMaskIntoConstraints = false

        cardView.addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: rateTitle.centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        nextImage.heightAnchor.constraint(equalTo: rateTitle.heightAnchor, multiplier: 0.3).isActive = true
        nextImage.widthAnchor.constraint(equalTo: rateTitle.heightAnchor, multiplier: 0.3).isActive = true



        cardView.addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: rateTitle.bottomAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        startFromLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true

        cardView.addSubview(hotelImage)
        hotelImage.anchorToTop(top: rateTitle.bottomAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor)

        let blackView = BlackView()
        hotelImage.addSubview(blackView)
        blackView.anchorToTop(top: hotelImage.topAnchor, left: hotelImage.leftAnchor, bottom: hotelImage.bottomAnchor, right: hotelImage.rightAnchor)



        //        let nextImage = UIImageView()
        //        nextImage.translatesAutoresizingMaskIntoConstraints = false
        //        nextImage.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)
        //
        //
        //



    }

    let rateTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Limited Offer - Get 5% Off - Tell Me More"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        return lbl
    }()

    let knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        return btn
    }()

    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()

    let hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()




}


