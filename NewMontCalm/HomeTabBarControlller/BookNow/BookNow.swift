//
//  BookNow.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class BookNow: UITableViewController{
    
    // MARK: View life cycle
    var headerView: HeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

    }

    
    func setup(){
        //navigationController?.navigationBar.isHidden = true
        
        tableView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height * 0.3 , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -UIScreen.main.bounds.height * 0.3)
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(BookCell.self, forCellReuseIdentifier: "BookCell")
        tableView.showsVerticalScrollIndicator = false
        navigationItem.title = ""

    }
    
    
    
    
    // MARK: UI Elements
    
    let temperature: UILabel = {
        let lbl = UILabel()
        lbl.text = "25°C\nLocal Temperature"
        lbl.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let dayNightImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "sun").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
}



