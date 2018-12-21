//
//  GallerySmallCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 03/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class GallerySmallCell: UICollectionViewCell{


    var galleryImage: String?{
        didSet{
            if let imageUrl = galleryImage, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }
        }
    }

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
    }
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
}
