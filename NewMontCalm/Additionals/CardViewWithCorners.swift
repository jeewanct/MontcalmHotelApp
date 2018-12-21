//
//  CardViewWithCorners.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 14/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class CardViewWithCorners: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10)
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.3, height: 0.3);
        layer.shadowOpacity = 0.5
        layer.shadowPath = shadowPath.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
