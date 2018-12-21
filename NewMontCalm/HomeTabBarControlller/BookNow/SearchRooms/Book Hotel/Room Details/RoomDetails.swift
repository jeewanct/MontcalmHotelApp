//
//  RoomDetails.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class RoomDetails: UIViewController {

    var roomId: String?
    var roomData: RoomDetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()

        self.performSelector(inBackground: #selector(getRoomDetails), with: nil)
        print("The room id is ", roomId)
    }
    
    func setup(){
        SearchRooms.checkInLabel.setTitle("", for: .normal)
        SearchRooms.checkOutLabel.setTitle("", for: .normal)

        navigationController?.hidesBarsOnSwipe = false
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        title = "Room Details"
        
    }
    
    
    lazy var contentTable: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
        tv.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tv.rowHeight = UITableViewAutomaticDimension 
        tv.register(RoomDetailsCell.self, forCellReuseIdentifier: "RoomDetailsCell")
        return tv
    }()
    
    let totalButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Total: $200", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        return btn
    }()
    
    let bookNowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("BOOK NOW", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        // btn.addTarget(self, action: #selector(handleBookNow), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    
    
    
    
}
