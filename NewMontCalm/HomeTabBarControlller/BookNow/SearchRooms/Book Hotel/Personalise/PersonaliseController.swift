//
//  PersonaliseController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class PersonaliseController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }
    
    func setup(){
        self.automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = false
        SearchRooms.checkInLabel.setTitle("", for: .normal)
        SearchRooms.checkOutLabel.setTitle("", for: .normal)
        collectionView?.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        collectionView?.register(PersonliseCell.self, forCellWithReuseIdentifier: "PersonaliseCell")
        navigationItem.title = "Personalise Your Stay"
       collectionView?.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0 )
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        
    }
    
    
    
    let enhancmentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Enchancements", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(handleEnhancment), for: .touchUpInside)
        return btn
    }()
    
    let aromasButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.setTitle("Aromas", for: .normal)
        btn.addTarget(self, action: #selector(handlearomas), for: .touchUpInside)
        return btn
    }()
    
    let pillowsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.setTitle("Pillows", for: .normal)
        btn.addTarget(self, action: #selector(handlePillows), for: .touchUpInside)
        return btn
    }()
    
    let movingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        return view
    }()

    let comparePricesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("TOTAL:£200", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
      //  btn.addTarget(self, action: #selector(handleComparePrices), for: .touchUpInside)
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
        btn.addTarget(self, action: #selector(handleReservation), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    let containerView: CardView = {
        let containerView = CardView()
        // containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
    }()
}
