//
//  UpcomingBookingController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class UpcomingBookingController: UIViewController {

    var section: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    func setup(){
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)

    }



    let cancelButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
        btn.setTitle("CANCEL SELECTED BOOKINGS", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return btn
    }()

    lazy var contentTable:UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.showsVerticalScrollIndicator = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UpcomingBooking")
        tv.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tv.separatorStyle = .none
        return tv
    }()
}
