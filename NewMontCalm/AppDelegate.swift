//
//  AppDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
// button.titleLabel.numberOfLines = 1;
// button.titleLabel.adjustsFontSizeToFitWidth = YES;
// button.titleLabel.lineBreakMode = NSLineBreakByClipping;

import UIKit
import GoogleMaps
import GooglePlaces
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        application.statusBarStyle = .lightContent
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeTabBarController()
        setAppearance()
        GMSServices.provideAPIKey(Constants.ApisUrl.GOOGLEAPI)

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setAppearance(){
        // UIView.appearance().backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        UINavigationBar.appearance().tintColor = Constants.Appearance.NAVIGATIONTINTCOLOR
       // UILabel.appearance().font  = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        
      //  UITextField.appearance().font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)

    }
    
    
}


