//
//  BookHotelNow.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit



class BookHotelNow: UICollectionViewController{
    
    var cellIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    
    }
    
    func setup(){
        // navigationController?.navigationBar.isHidden = true
        navigationItem.title = ""
        collectionView?.isPagingEnabled = true

        collectionView?.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        collectionView?.contentOffset = CGPoint(x: 0, y: -44)
        //view.backgroundColor = Constants.Appearance.backgroundColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        collectionView?.backgroundColor = .white
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)

        collectionView?.register(BookHotelNowCell.self, forCellWithReuseIdentifier: "BookHotelNowCell")

        collectionView?.register(RateTypeCell.self, forCellWithReuseIdentifier: "RateTypeCell")


        
    }

    // UI Elements
    
    let roomButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitle("Room", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handleRoomButton), for: .touchUpInside)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let rateTypeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitle("Rate Type", for: .normal)
        btn.addTarget(self, action: #selector(handlerateButton), for: .touchUpInside)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let flexibleDateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handleflexible), for: .touchUpInside)
        btn.setTitle("Flexible Date", for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let movingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        return view
    }()
    
    let comparePricesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("COMPARE PRICES", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        btn.addTarget(self, action: #selector(handleComparePrices), for: .touchUpInside)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    
    let bookNowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("BOOK NOW", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.addTarget(self, action: #selector(handleBookNow), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
    }()
}
