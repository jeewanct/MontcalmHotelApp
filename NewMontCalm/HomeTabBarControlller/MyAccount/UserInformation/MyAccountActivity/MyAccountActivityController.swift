//
//  MyAccountActivityController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class MyAccountActivityController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        //tabBarController?.tabBar.isHidden = true
        navigationItem.title = "Bookings"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)


    }
    
    func setup(){
        collectionView?.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        collectionView?.register(MyAccountActivityCell.self, forCellWithReuseIdentifier: "MyAccountActivityCell")
        collectionView?.isPagingEnabled = true
        collectionView?.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
    }
    
    let upcomingBooking: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Upcoming Bookings", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handleUpcomingBookings), for: .touchUpInside)
        return btn
    }()
    
    let previousBookings: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.setTitle("Previous Bookings", for: .normal)
        btn.addTarget(self, action: #selector(handlePreviousBookings), for: .touchUpInside)
        return btn
    }()
    
    let movingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        return view
    }()
    
    
    
    
    
}
