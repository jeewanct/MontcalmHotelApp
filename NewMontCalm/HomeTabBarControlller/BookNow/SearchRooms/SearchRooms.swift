//
//  SearchRooms.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SearchRooms: UITableViewController{
    var hotelList: SearchRoomModel?


    //  MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        apiCall()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = ""
        //navigationController?.hidesBarsOnSwipe = true
        tabBarController?.tabBar.isHidden = true

    }
    
    func setup(){
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tableView.register(SearchRoomCell.self, forCellReuseIdentifier: "SearchRooms")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        let toggleMapButton = UIBarButtonItem(title: "Toogle", style: .plain, target: self, action: #selector(handleToggleMap))
        navigationItem.rightBarButtonItem = toggleMapButton
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

//        let backButton = UILabel(frame: CGRect(x: 16, y: 0, width: 0, height: 0))
//        backButton.text  = "Back"
//        navigationController?.navigationItem.titleView = backButton

        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backButton

        
    }

    @objc func handleBack(){
        self.dismiss(animated: true, completion: nil)
    }

    let checkInOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    static let checkInLabel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("17/07/17 ▼", for: .normal)
        btn.titleLabel?.numberOfLines = 1

        btn.titleLabel?.adjustsFontSizeToFitWidth = true;
           // btn.titleLabel?.lineBreakMode =                  //NSLineBreakByClipping;
            btn.setTitleColor(#colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1), for: .normal)
            //  btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 16)
            return btn
    }()
    
    static let checkOutLabel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(#colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        //btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 16)
        btn.setTitle("17/07/17 ▼", for: .normal)
        btn.titleLabel?.textColor = .black
        return btn
    }()
}
