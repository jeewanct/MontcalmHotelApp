//
//  CalendarCell.swift
//  Calendar
//
//  Created by Jeevan chandra on 16/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell{

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setup()
    }

    func setup(){

        addSubview(selectedView)
        selectedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        selectedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        selectedView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        selectedView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true


        addSubview(leftView)
        leftView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        leftView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        leftView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true


        addSubview(rightView)

        rightView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        rightView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true





        addSubview(dateLabel)
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

    override func draw(_ rect: CGRect) {
        let path =  UIBezierPath(roundedRect: leftView.bounds, byRoundingCorners: [UIRectCorner.bottomLeft, UIRectCorner.topLeft], cornerRadii: CGSize(width: 5, height: 5))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.shouldRasterize = true
        leftView.layer.mask = shape


        let path2 =  UIBezierPath(roundedRect: leftView.bounds, byRoundingCorners: [UIRectCorner.topRight, UIRectCorner.bottomRight], cornerRadii: CGSize(width: 5, height: 5))
        let shape1 = CAShapeLayer()
        shape1.path = path2.cgPath
        shape1.shouldRasterize = true
        rightView.layer.mask = shape1




    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let selectedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        //  view.layer.cornerRadius = (UIScreen.main.bounds.height * 0.6 * 0.2 )/2
        view.isHidden = true
        return view
    }()

    let leftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown

        view.isHidden = true
        return view
    }()


    let rightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.isHidden = true
        return view
    }()


}

