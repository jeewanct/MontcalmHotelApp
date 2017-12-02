//
//  HomeTabBarController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tabBar.isTranslucent = false
        
    }
    
    func setup(){

        tabBar.tintColor = .black
        let bookNow = UINavigationController(rootViewController: BookNow())
        bookNow.tabBarItem.title = "Book"
        bookNow.tabBarItem.image = #imageLiteral(resourceName: "credit-card")
        bookNow.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        bookNow.tabBarItem.tag = 0
        
        
        let explore = UINavigationController(rootViewController: Explore())
        explore.tabBarItem.title = "Explore"
        explore.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        explore.tabBarItem.tag = 1
        explore.tabBarItem.image = #imageLiteral(resourceName: "compass")
        
        
        let offers = UINavigationController(rootViewController: Offers())
        offers.tabBarItem.title = "Offers"
        offers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        offers.tabBarItem.tag = 2
        offers.tabBarItem.image = #imageLiteral(resourceName: "gift")
        
        
        let myAccount = UINavigationController(rootViewController: LoginRegister())
        myAccount.tabBarItem.title = "Account"
        myAccount.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        myAccount.tabBarItem.tag = 3
        myAccount.tabBarItem.image = #imageLiteral(resourceName: "user")
        
        
        let contacts = UINavigationController(rootViewController: Contacts())
        contacts.tabBarItem.title = "Contacts"
        contacts.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        contacts.tabBarItem.tag = 4
        contacts.tabBarItem.image = #imageLiteral(resourceName: "phone-call")
        
        
        
        viewControllers = [bookNow, explore, offers, myAccount, contacts]
        
        
        
    }
    

    

}
