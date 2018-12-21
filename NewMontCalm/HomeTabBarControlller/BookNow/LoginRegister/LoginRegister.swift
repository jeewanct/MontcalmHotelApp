//
//  LoginRegister.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class LoginRegister: UITableViewController{


    var headerView: LoginHeaderView!
    let loginCell = LoginRegisterCell()
    var loginData: LoginModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addViews()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isHidden = true
        navigationItem.title = ""
        tabBarController?.tabBar.isHidden = false
        loginCell.signupButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
       // self.hidesBottomBarWhenPushed = true
    }

    
}
