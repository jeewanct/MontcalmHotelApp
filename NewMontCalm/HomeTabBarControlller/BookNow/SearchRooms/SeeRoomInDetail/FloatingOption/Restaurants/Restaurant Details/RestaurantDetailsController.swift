//
//  RestaurantDetailsController.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 08/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class RestaurantDetailController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
    }
    
    
    func setup(){
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        navigationItem.title = "Restaurant Details"
    }
    
    let imageGallery: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let restaurantName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        lbl.text = "Restaurant Name"
        return lbl
    }()
    
    let restaurantdetail: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor nulla lacus, a vestibulum nibh fermentum quis. Donec aliquam nisl nec varius auctor. Sed in nisi at lacus ultrices lacinia. Quisque lacinia elit orci. Mauris gravida ullamcorper sapien quis molestie. Aliquam sodales a diam in dapibus. Nam imperdiet mollis lorem, sit amet commodo nulla pulvinar vel. Etiam vestibulum, lacus laoreet gravida semper, risus nisl sagittis urna, at rhoncus turpis lectus eu nisl. Suspendisse viverra, orci id finibus lacinia, augue ipsum placerat lacus, at semper nisl felis vel mi. Donec pharetra, ante vel cursus rutrum, odio urna dictum orci, sed venenatis lorem ante sed orci. Proin gravida, ipsum vitae tempus vestibulum, sem velit porta odio, ac ultrices nulla ante ac ipsum."
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.numberOfLines = 0
        lbl.textColor = .black
        return lbl
    }()
    
}
