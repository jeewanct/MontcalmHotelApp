//
//  MyAccountCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 21/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class MyAccountCell: UITableViewCell{

    var parentInstance: MyAccount?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        selectionStyle = .none
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews(){
        let sepView = UIView()
        sepView.translatesAutoresizingMaskIntoConstraints = false
        sepView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addSubview(sepView)
        
        
        addSubview(optionValue)
        optionValue.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: sepView.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        optionValue.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        let nextImage = UIImageView()
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)
        
        
        addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        nextImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        nextImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        
        
        sepView.anchorToTop(top: optionValue.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        sepView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    let optionValue: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
}

class MyAccountMainCell: UITableViewCell {

    var parentInstance: MyAccount?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        backgroundColor = .clear
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    lazy var  profileEditTable: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(MyAccountCell.self, forCellReuseIdentifier: "MyAccountCell")
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        return tv
    }()

    let currentPoints: UILabel = {
        let lbl = UILabel()
        //  lbl.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0,000,000"
        //lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()

    let qualifiedNights: UILabel = {
        let lbl = UILabel()
        //  lbl.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0,000,000"
        lbl.numberOfLines = 0
        //  lbl.textAlignment = .center
        return lbl
    }()
    let qualifiedStays: UILabel = {
        let lbl = UILabel()
        //  lbl.backgroundColor = .orange
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0,000,000"
        lbl.baselineAdjustment = .alignCenters
        lbl.adjustsFontSizeToFitWidth = true
        // lbl.textAlignment = .center
        return lbl
    }()


    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints  = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

    let userName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cleo Stephenson"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let memberIDLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Member ID: 03840909"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()




}
