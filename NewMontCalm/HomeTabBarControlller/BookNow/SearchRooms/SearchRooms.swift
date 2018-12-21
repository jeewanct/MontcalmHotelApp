//
//  SearchRooms.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SearchRooms: UITableViewController{
    var hotelList: [ListOfAvailableHotels]?
    var dates: [String: Date]?{
        didSet{
            setDates()
        }
    }
    
    //  MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        callApi()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        navigationItem.title = ""
        tabBarController?.tabBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = false
        
    }
    
    func setup(){
        // tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        tableView.register(SearchRoomCell.self, forCellReuseIdentifier: "SearchRooms")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        let toggleMapButton = UIBarButtonItem(image: #imageLiteral(resourceName: "locationOpen").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleToggleMap))
        toggleMapButton.tintColor = Constants.Appearance.PRIMARYCOLOR
        
        navigationItem.rightBarButtonItem = toggleMapButton
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        
        
    }
    
    
    func callApi(){
        
        if let window = UIApplication.shared.keyWindow{
            window.addSubview(activityIndicator)
            activityIndicator.activityIndicator.startAnimating()
            activityIndicator.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        }
        
        self.performSelector(inBackground: #selector(handleApiCall), with: nil)
        
    }
    
    func setDates(){
        
        
        if let checkInDate = dates?["checkIn"], let checkOutDate = dates?["checkOut"]
        {
            SearchRooms.checkInLabel.setTitle("\(LogicHelper.shared.convertDateToTitle(date: checkInDate)) ▼ -", for: .normal)
            SearchRooms.checkOutLabel.setTitle(" \(LogicHelper.shared.convertDateToTitle(date: checkOutDate)) ▼", for: .normal)
        }
        
        
    }
    
    @objc func openCalendar(){
        self.navigationController?.pushViewController(CalendarController(), animated: true)
    }
    
    @objc func handleBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var checkInOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        return btn
    }()
    
    static let checkInLabel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("17/07/17 ▼ -", for: .normal)
        btn.titleLabel?.numberOfLines = 1
        btn.contentHorizontalAlignment = .right
        btn.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true;
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.setTitleColor(#colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1), for: .normal)
        
        return btn
    }()
    
    static let checkOutLabel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(#colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
         btn.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        //btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 16)
        btn.setTitle(" 17/07/17 ▼", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.textColor = .black
        return btn
    }()
    
    let activityIndicator = ActivityIndicatorView()
}
