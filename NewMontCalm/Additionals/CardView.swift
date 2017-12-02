//
//  CardView.swift
//  Calendar
//
//  Created by Jeevan chandra on 16/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class CardView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func layoutSubviews() {
        layer.cornerRadius = 0
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5);
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

