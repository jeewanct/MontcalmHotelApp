//
//  HomeTabBarController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//



//{
//"number_of_page":"1",
//"number_of_result":"10",
//"email":"test@neotericuk.com"
//} http://apithemontcalm.neowebservices.co.uk/api/V2/ws/getReservationHistory


import UIKit

class HomeTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tabBar.isTranslucent = true
        
    }
    
    func setup(){

        tabBar.tintColor = .black
        let bookNow = UINavigationController(rootViewController: BookNow())
        bookNow.tabBarItem.title = "Book"
        bookNow.tabBarItem.image = #imageLiteral(resourceName: "credit-card")
        bookNow.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
       // bookNow.tabBarItem.tag = 0
        
        
        let explore = UINavigationController(rootViewController: Explore())
        explore.tabBarItem.title = "Explore"
        explore.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
       // explore.tabBarItem.tag = 1
        explore.tabBarItem.image = #imageLiteral(resourceName: "compass")
        
        
        let offers = UINavigationController(rootViewController: Offers())
        offers.tabBarItem.title = "Offers"
        offers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
       // offers.tabBarItem.tag = 2
        offers.tabBarItem.image = #imageLiteral(resourceName: "gift")
        

//            {
//            "membershipNumber": "45017646",
//            "password": "test@neo"
//        }

        let myAccount = UINavigationController(rootViewController: LoginRegister())
        myAccount.tabBarItem.title = "Account"
        myAccount.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
       // myAccount.tabBarItem.tag = 3
        myAccount.tabBarItem.image = #imageLiteral(resourceName: "user")

        let myAccountDetails = UINavigationController(rootViewController: MyAccount())
        myAccountDetails.tabBarItem.title = "Account"
        myAccountDetails.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        // myAccount.tabBarItem.tag = 3
        myAccountDetails.tabBarItem.image = #imageLiteral(resourceName: "user")
        
        
        let contacts = UINavigationController(rootViewController: Contacts())
        contacts.tabBarItem.title = "Contacts"
        contacts.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
       // contacts.tabBarItem.tag = 4
        contacts.tabBarItem.image = #imageLiteral(resourceName: "phone-call")
        

        if (UserDefaults.standard.value(forKey: "isLogin") != nil){

            if let userLoginValue = UserDefaults.standard.value(forKey: "isLogin") as? Bool{
                if userLoginValue == true{
                    viewControllers = [bookNow, explore, offers, myAccountDetails, contacts]
                }else{
                    viewControllers = [bookNow, explore, offers, myAccount, contacts]
                }
            }
        }else{
            viewControllers = [bookNow, explore, offers, myAccount, contacts]
        }
        

        
        
        
    }
    

    

}
