//
//  SignUpController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SignUpController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }

    func setup(){


        tableView.register(PersonalDetailsCell.self, forCellReuseIdentifier: "PersonalDetailsCell")
        tableView.register(AddressDetails.self, forCellReuseIdentifier: "AddressDetails")
        tableView.register(ContactInformationCell.self, forCellReuseIdentifier: "ContactInformationCell")
        tableView.register(AdditionalInformationCell.self, forCellReuseIdentifier: "AdditionalInformationCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        tableView.delegate = self
        tableView.dataSource = self


        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR

        if #available(iOS 11.0, *){
             navigationController?.navigationBar.prefersLargeTitles = true
        }



        title = "Sign up"
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleClose))
        closeButton.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        navigationItem.rightBarButtonItem = closeButton
    }

    @objc func handleClose(){
        self.dismiss(animated: true, completion: nil)
    }


//    lazy var userInformationTableView: UITableView = {
//        let tv = UITableView()
//        tv.delegate = self
//        tv.dataSource = self
//        tv.register(PersonalDetailsCell.self, forCellReuseIdentifier: "PersonalDetailsCell")
//        tv.register(AddressDetails.self, forCellReuseIdentifier: "AddressDetails")
//        tv.register(ContactInformationCell.self, forCellReuseIdentifier: "ContactInformationCell")
//        tv.register(AdditionalInformationCell.self, forCellReuseIdentifier: "AdditionalInformationCell")
//        tv.showsVerticalScrollIndicator = false
//        tv.separatorStyle = .none
//        tv.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        return tv
//    }()




}
