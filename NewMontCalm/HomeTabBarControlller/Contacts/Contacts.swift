//
//  Contacts.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class Contacts: UITableViewController{

    var hotelList:SearchRoomModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        setup()
        apiCall()
    }
    
    func setup(){
        tableView.register(ContactsCell.self, forCellReuseIdentifier: "ContactsCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Contact Us"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        
        
       // self.edgesForExtendedLayout = [.bottom]
      //  self.hidesBottomBarWhenPushed = true
        
    }
    
}

