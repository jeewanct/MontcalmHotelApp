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
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       // backgroundColor = .clear
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){

        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        cardView.addSubview(backgroundImage)
        backgroundImage.anchorToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor)

        backgroundImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))


        let blackView = BlackView()
        cardView.addSubview(blackView)
        blackView.anchorToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor)


      
        cardView.addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        cardView.addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: cardView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        startFromLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.4).isActive = true

        cardView.addSubview(lastroomsLabel)
        lastroomsLabel.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: startFromLabel.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 16, rightConstant: 16)
        lastroomsLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.4).isActive = true


        cardView.addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: nil, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        uberButton.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.4).isActive = true
        uberButton.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.12).isActive = true

        cardView.addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left: cardView.leftAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        callButton.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.4).isActive = true

        cardView.addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: nil, left: callButton.rightAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 16, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
        whatsAppButton.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.4).isActive = true


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
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()

    let lastroomsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Last 2 rooms left"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
    
    
    let backgroundImage: UIImageView = {
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
        lbl.text = "The Montcalm London Marble Arch"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()
}

import UIKit

class RateTypeHeaderView: UIView{
    var cellIndex: Int?
    var rateTypeCellIndex: RateTypeCell?


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
        backgroundColor = .white
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


        let knowMoreTitle = NSAttributedString(string: "Know More", attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue, NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR] )

        knowMoreButton.setAttributedTitle(knowMoreTitle, for: .normal)


        addSubview(rateTitle)
        rateTitle.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        rateTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true


        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: topAnchor, left: rateTitle.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0)


        let nextImage = UIImageView()
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)



        addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        nextImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        nextImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true


    }

    let rateTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rooms With A Square View -"
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




}


