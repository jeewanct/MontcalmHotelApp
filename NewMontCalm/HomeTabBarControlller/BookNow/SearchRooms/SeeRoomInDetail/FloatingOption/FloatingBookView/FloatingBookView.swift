//
//  FloatingBookView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class FloatingBookView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }

    func addViews(){
        addSubview(contentTableView)
        contentTableView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var contentTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(BookNowInformationCell.self, forCellReuseIdentifier: "BookNowInformationCell")
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
        tv.register(BookNowHotelListingCell.self, forCellReuseIdentifier: "BookNowHotelListingCell")
        return tv
    }()
    

}


