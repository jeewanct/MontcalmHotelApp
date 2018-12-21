//
//  Offers.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class Offers: UITableViewController{

    var offersData: [OffersTabBarHotels]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        setup()
        callApi()
        
    }
    
    func callApi(){
        
        if let window = UIApplication.shared.keyWindow{
            
            window.addSubview(activityIndicator)
            activityIndicator.activityIndicator.startAnimating()
            activityIndicator.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
            
        }
        
        self.performSelector(inBackground: #selector(handleGetOffers), with: nil)
    }
    
    func setup(){
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Offers"
        tableView.register(OffersCell.self, forCellReuseIdentifier: "OffersCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
        tableView.separatorStyle = .none
    }

    let activityIndicator = ActivityIndicatorView()
    
    
}

