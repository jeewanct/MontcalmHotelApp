//
//  MyAccountActivityController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class MyAccountActivityController: UITableViewController{

    //MARK:   View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    func setup(){

        
        title = "Bookings"
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tableView.register(MyAccountActivityCell.self , forCellReuseIdentifier: "MyAccountActivityCell")
        tableView.register(MyAccountActivityFilterCell.self, forCellReuseIdentifier: "MyAccountActivityFilterCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    
}
