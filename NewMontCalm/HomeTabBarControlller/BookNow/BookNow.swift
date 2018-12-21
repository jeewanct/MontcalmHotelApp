//
//  BookNow.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


protocol getCheckInOutDate {
    func getCheckInCheckOutDate(checkInDate: Date, checkOutDate: Date)
}



class BookNow: UITableViewController, OpenCalendar, getCheckInOutDate{
    func openCalendar(value: Int) {
    
        let obj = CalendarController()
        obj.delegate = self
        present(UINavigationController(rootViewController: obj), animated: true, completion: nil)
    }
    
    
    var homeCell = BookCell()
    
  
    
    // MARK: View life cycle
    var headerView: HeaderView!
    var currencyList: [GetCurrency]?
    var homeData: HomeContactModel?
    var dates = [
        "checkIn": Date(),
        "checkOut": LogicHelper.shared.addOneToDate(date: Date())
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setup()
        callApis()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

    }

    func callApis(){
        performSelector(inBackground: #selector(handleGetCurrency), with: nil)
        performSelector(inBackground: #selector(handleGetHomeData), with: nil)
    }
    
    func getCheckInCheckOutDate(checkInDate: Date, checkOutDate: Date){
        
        homeCell.dateView.checkIn = checkInDate
        homeCell.dateView.checkOut = checkOutDate
        
        dates.updateValue(checkInDate, forKey: "checkIn")
        dates.updateValue(checkOutDate, forKey: "checkOut")
        
    }
    
    
    @objc func handleGetHomeData(){
        
        let obj = ViewControllersHTTPRequest()
        obj.getHomeContactDetails(completion: { (data) in
            self.homeData = data
            self.homeCell.hotelList = self.homeData?.hotelList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            
        }
        
        
    }

    @objc func handleGetCurrency(){


        let obj = ViewControllersHTTPRequest()


        obj.getCurrencyList(completion: { (currencyList) in

            self.currencyList = currencyList
            self.homeCell.currencyList = self.currencyList

        }) { (error) in

            
        }
        
    }

    
    func setup(){
        //navigationController?.navigationBar.isHidden = true
        
        tableView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height * 0.3 , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -UIScreen.main.bounds.height * 0.3)
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        navigationItem.title = ""
        homeCell.dateView.delegate = self
        homeCell.searchRoomsButton.addTarget(self, action: #selector(handleSearchRooms), for: .touchUpInside)
        homeCell.searchRoomsButton.addTarget(self, action: #selector(handleSearchRooms), for: .touchUpInside)
        
        homeCell.dateView.checkIn = Date()
        homeCell.dateView.checkOut = LogicHelper.shared.addOneToDate(date: Date())
        

    }
    
    
    
    
    // MARK: UI Elements
    
    let temperature: UILabel = {
        let lbl = UILabel()
        lbl.text = "25°C\nLocal Temperature"
        lbl.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let dayNightImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "sun").withRenderingMode(.alwaysOriginal)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
}



