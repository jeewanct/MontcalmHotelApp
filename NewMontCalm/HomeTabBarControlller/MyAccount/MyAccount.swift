//
//  MyAccount.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class MyAccount: UITableViewController{

    let myAccountCell = MyAccountMainCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        navigationItem.title = "My Account"
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }

    
    func setup(){
        navigationItem.title = ""

        ///////self.edgesForExtendedLayout = [.bottom]
       // self.hidesBottomBarWhenPushed = true
    }


//    lazy var mainTableView: UITableView = {
//        let tv = UITableView()
//        tv.delegate = self
//        tv.dataSource = self
//        tv.backgroundColor = .clear
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        tv.register(MyAccountMainCell.self, forCellReuseIdentifier: "MyAccountMainCell")
//      //  tv.isScrollEnabled = false
//        tv.separatorStyle = .none
//        return tv
//    }()
    

     
    
}



