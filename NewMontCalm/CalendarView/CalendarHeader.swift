//
//  CalendarHeader.swift
//  Calendar
//
//  Created by Jeevan chandra on 16/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarHeader: JTAppleCollectionReusableView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup(){
        backgroundColor = .white
        addViews()
    }

    func addViews(){
        addSubview(monthLabel)
        monthLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 8).isActive = true
        monthLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        monthLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        monthLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true

        addSubview(yearLabel)
        yearLabel.leftAnchor.constraint(equalTo: monthLabel.rightAnchor).isActive = true
        yearLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        yearLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        yearLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -8).isActive = true

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor,constant:8).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor,constant: -8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.topAnchor.constraint(equalTo: yearLabel.bottomAnchor).isActive = true



        addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        _ = weeks(name: "Sun")
        _ = weeks(name: "Mon")
        _ = weeks(name: "Tue")
        _ = weeks(name: "Wed")
        _ = weeks(name: "Thur")
        _ = weeks(name: "Fri")
        _ = weeks(name: "Sat")




    }

    func weeks(name: String) -> UILabel{
        let lbl = UILabel()
        lbl.text = name
        lbl.font = UIFont(name: lbl.font.fontName, size: 14)
        lbl.textAlignment = .center
        stackView.addArrangedSubview(lbl)
        return lbl
    }




    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let monthLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: lbl.font.fontName, size: 20)
        lbl.text = "September"
        lbl.textAlignment = .left
        return lbl
    }()

    let yearLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: lbl.font.fontName, size: 20)
        lbl.textAlignment = .right
        lbl.text = "'17"
        return lbl
    }()

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
}

