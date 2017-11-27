//
//  HeaderView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        // The container view is needed to extend the visible area for the image view
        // to include that below the navigation bar. If this container view isn't present
        // the image view would be clipped at the navigation bar's bottom and the parallax
        // effect would not work correctly
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        let visualView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        visualView.alpha = 0.3
        addSubview(visualView)
        visualView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        //visualView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

       


    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }




    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

   
}
