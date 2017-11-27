//
//  ConstantViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ViewWithTextAndLine: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addViews(){
        addSubview(constantLineView)
        constantLineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        constantLineView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        constantLineView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        constantLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        addSubview(constantLabel)
        constantLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        constantLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        constantLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        constantLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let constantLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    let constantLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Our Properties"
        lbl.textAlignment = .center
        lbl.textColor = .gray
        return lbl
    }()
}
