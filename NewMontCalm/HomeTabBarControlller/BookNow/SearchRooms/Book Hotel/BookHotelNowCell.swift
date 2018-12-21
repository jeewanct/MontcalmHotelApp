//
//  BookHotelNowCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


protocol MakeEnhancmentModel {
    func makeEnhancmentModel(section: Int?, item: Int?, rateData: RateTypeRulesModel?)
}

protocol MakeEnhanmentModelRateType {
    func makeEnhancmentModel(section: Int?, item: Int?, roomData: RateRoomDetailsModels?)
}


class BookHotelNowCell: UICollectionViewCell, MakeEnhancmentModel{

    var enhancmentModel = [EnhancmentRoomModel]()
    var cellIndex: Int?
    var bookHotelNowInstance: BookHotelNow?
    var delegate: CommunicationRateAndRoomType?
    
    var roomData: [RateRoomDetailsModels]?{
        didSet{
            contentTable.reloadData()
            self.madeChanges()

        }

    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        madeChanges()
    }

    
    func makeEnhancmentModel(section: Int?, item: Int?, rateData: RateTypeRulesModel?) {

        if let getSection = section, let getItem = item, let getRateData = rateData{
            roomData?[getSection].rateType?[getItem] = getRateData
          print("number of rooms" , roomData?[getSection].rateType?[getItem].numberOfRooms )

            delegate?.communication(roomId: roomData?[getSection].roomId, rateId: roomData?[getSection].rateType?[getItem].rateRuleId, numberOfRooms: rateData?.numberOfRooms, roomData: roomData)
            
        }





    }

    func madeChanges(){

       


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

    var cellItem: Int?
    var cellSection: Int?
    var delegate: MakeEnhancmentModel?


    var rateData: RateTypeRulesModel?{
        didSet{
            roomsButton.setTitle(rateData?.numberOfRooms, for: .normal)
            limitedOffer.text = rateData?.rateName
        }
    }


    var rateTypeText: String?{
        didSet{
            limitedOffer.text = rateTypeText
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup(){


        let cardView = WhiteView()
        addSubview(cardView)

        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true



        
        cardView.addSubview(limitedOffer)
        limitedOffer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        limitedOffer.leftAnchor.constraint(equalTo: cardView.leftAnchor,constant: 16).isActive = true
        limitedOffer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        limitedOffer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true

        cardView.addSubview(roomsButton)
        roomsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roomsButton.leftAnchor.constraint(equalTo: limitedOffer.rightAnchor,constant:8).isActive = true
        roomsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor,constant: -16).isActive = true
        roomsButton.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.9).isActive = true

        

    }

    @objc func handleAddedRoom(){
        print("Hi I am selecting room")
        if let window = UIApplication.shared.keyWindow{


            selectRooms.contentTable.delegate = self
            selectRooms.contentTable.dataSource = self

            window.addSubview(selectRooms)
            selectRooms.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)


        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let limitedOffer: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Limited - Get 5% off ($20.00)"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()

    lazy var roomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Select", for: .normal )
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(handleAddedRoom), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    let selectRooms = NumberOfRoomsView()

}


class RateTypeCell: UICollectionViewCell, MakeEnhanmentModelRateType{



    var delegate: CommunicationRateAndRoomType?
    var cellIndex: Int?
    var bookHotelNowInstance: BookHotelNow?
    var roomsData: [RateTypeRulesModel]?{
        didSet{
            contentTable.reloadData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
    }



    func makeEnhancmentModel(section: Int?, item: Int?, roomData: RateRoomDetailsModels?) {

        if let getSection = section, let getItem = item, let getRoomData = roomData{
            roomsData?[getSection].rooms?[getItem] = getRoomData
            print("number of rooms" , roomsData?[getSection].rooms?[getItem].numberOfRooms )

            delegate?.coomunicationRate(roomId: getRoomData.roomId, rateId: roomsData?[getSection].rateRuleId, numberOfRooms: roomData?.numberOfRooms, rateData: roomsData)


        }

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

    var cellItem: Int?
    var cellSection: Int?
    var delegate: MakeEnhanmentModelRateType?

    
    var roomDetails: RateRoomDetailsModels?{
        didSet{
            roomName.text = roomDetails?.roomName
            roomsButton.text = roomDetails?.numberOfRooms
        }
    }


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        addViews()
        backgroundColor = .clear
    }

    func setup(){


    }

    func addViews(){

        let cardView = WhiteView()
        addSubview(cardView)

        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true




        cardView.addSubview(roomName)
        roomName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roomName.leftAnchor.constraint(equalTo: cardView.leftAnchor,constant: 16).isActive = true
        roomName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        roomName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true

        cardView.addSubview(roomsButton)
        roomsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roomsButton.leftAnchor.constraint(equalTo: roomName.rightAnchor,constant:8).isActive = true
        roomsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor,constant: -16).isActive = true
        roomsButton.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.9).isActive = true

    }

    @objc func handleAddedRoom(){
        print("Hi I am selecting room")
        if let window = UIApplication.shared.keyWindow{


            selectRooms.contentTable.delegate = self
            selectRooms.contentTable.dataSource = self

            window.addSubview(selectRooms)
            selectRooms.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)


        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let roomName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Double Room Set"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()


    lazy var roomsButton: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "2 Rooms"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAddedRoom)))
        lbl.isUserInteractionEnabled = true
        return lbl
    }()


     let selectRooms = NumberOfRoomsView()
    




}
