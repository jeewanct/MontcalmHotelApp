//
//  BlackView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class BlackView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
