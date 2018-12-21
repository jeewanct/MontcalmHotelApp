//
//  BlackView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class WhiteView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

