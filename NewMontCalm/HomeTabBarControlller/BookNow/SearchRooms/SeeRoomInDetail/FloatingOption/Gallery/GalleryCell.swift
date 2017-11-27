//
//  GalleryCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 03/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit



class GalleryCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(backgroundImage)
        backgroundImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        addViews()
        
    }
    
    func gradientColor() {
        let gradientColor = CAGradientLayer()
        gradientColor.frame = frame
        gradientColor.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientColor.locations = [0.7, 1]
        layer.addSublayer(gradientColor)
    }
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
}
