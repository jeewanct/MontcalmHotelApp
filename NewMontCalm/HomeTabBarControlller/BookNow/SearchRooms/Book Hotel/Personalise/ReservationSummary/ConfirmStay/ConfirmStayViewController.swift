//
//  ConfirmStayViewController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ConfirmStayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }

    func setup(){
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
    }


    lazy var informationTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ConfirmStayCell.self, forCellReuseIdentifier: "ConfirmStayCell")
        return tv
    }()

}
