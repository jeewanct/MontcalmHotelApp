//
//  BookHotelNowCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class BookHotelNowCell: UICollectionViewCell{
    var cellIndex: Int?
    var bookHotelNowInstance: BookHotelNow?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
       // backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addSubview(contentTable)
        contentTable.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        
    }
    
    
    lazy var contentTable: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(RoomOffers.self, forCellReuseIdentifier: "roomCell")
        return tv
    }()
    
}

class RoomOffers: UITableViewCell{


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup(){

        addSubview(limitedOffer)
        limitedOffer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        limitedOffer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        limitedOffer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        limitedOffer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true

        addSubview(roomsButton)
        roomsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roomsButton.leftAnchor.constraint(equalTo: limitedOffer.rightAnchor,constant:8).isActive = true
        roomsButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        roomsButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let limitedOffer: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Limited - Get 5% off ($20.00)"
        lbl.textAlignment = .center
        lbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()

    let roomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(.black, for: .normal)
        // btn.setTitle("2 Rooms", for: .normal )
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


}


class RateTypeCell: UICollectionViewCell{

    
    var cellIndex: Int?
    var bookHotelNowInstance: BookHotelNow?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews(){
       // backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addSubview(contentTable)
        contentTable.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

    }


    lazy var contentTable: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(RateTypeTableCell.self, forCellReuseIdentifier: "RateTypeTableCell")
        return tv
    }()

}

class RateTypeTableCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        addViews()
       // backgroundColor = .white
    }

    func setup(){




    }

    func addViews(){
        addSubview(hotelImage)
        hotelImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
//        hotelImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
//        hotelImage.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT - UIScreen.main.bounds.height * 0.07).isActive = true

        let selectLabel = UILabel()
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.adjustsFontSizeToFitWidth = true
        selectLabel.minimumScaleFactor = 0.1
        selectLabel.text = "Please select the amount of rooms:"

        addSubview(selectLabel)
        selectLabel.anchorWithConstantsToTop(top: hotelImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        selectLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true

        addSubview(roomsButton)
        roomsButton.anchorWithConstantsToTop(top: hotelImage.bottomAnchor, left: selectLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

    let roomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
       // btn.setTitle("2 Rooms", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()




}
