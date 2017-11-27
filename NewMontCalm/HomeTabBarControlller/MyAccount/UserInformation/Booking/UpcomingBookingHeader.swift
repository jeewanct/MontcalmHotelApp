//
//  UpcomingBookingHeader.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class UpcomingBookingHeader: UIView{

    var section: Int?
    var upcomingInstance: UpcomingBookingController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    func addViews(){
        addSubview(downImage)
        downImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        downImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        downImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        downImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        addSubview(headerTitle)
        headerTitle.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        headerTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        
    }

    @objc func handleTap(){
        upcomingInstance?.section = section
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {
            self.downImage.transform = CGAffineTransform(rotationAngle: self.toRadians(degree: 90))
        }, completion: nil)


      self.upcomingInstance?.contentTable.reloadData()




    }

    func toRadians(degree: CGFloat) -> CGFloat{
        return CGFloat.pi * (degree / 180)
    }

    let downImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)
        return iv
    }()

    let headerTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Room Details"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return lbl
    }()

}
