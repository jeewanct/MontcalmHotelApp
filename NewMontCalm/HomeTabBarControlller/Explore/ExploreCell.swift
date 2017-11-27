//
//  ExploreCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell{
    
    var imageHeight: NSLayoutConstraint?
    var imageTop: NSLayoutConstraint?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    func setup(){
        clipsToBounds = true
        
        
        
        addSubview(exploreImage)
        imageHeight = exploreImage.heightAnchor.constraint(equalToConstant: 250)
        imageHeight?.isActive = true
        imageTop = exploreImage.topAnchor.constraint(equalTo: topAnchor,constant: 0)
        imageTop?.isActive = true
        exploreImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        exploreImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.alpha = 0.5
        exploreImage.addSubview(effectView)
        effectView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        addSubview(imageHeading)
        imageHeading.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageHeading.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let exploreImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "background").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let imageHeading: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 20)
        return lbl
    }()
}



















