//
//  SeeRoomInDetail.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

protocol OpenRoomDetails {
    func handleRoomDetails(roomId: String?)
}
class SeeRoomInDetail: UIViewController, OpenRoomDetails{

    var isButtonClicked = false
    var offersData: [OffersTabBarHotelOffers]?
    var restaurantBarData: [RestarurantHotelBars]?
    var meetingsData: [MeetingEventsHotelDetails]?
    var packageData: [PackagesDetails]?
    var hotelDetailData: HotelDetailModel?


    var hotelId: String?
    var bookNowView =  UIView()



    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setup()

     //  view = FloatingBookView ()
        let rightButtonBar = UIBarButtonItem(image: #imageLiteral(resourceName: "Floating").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFloatingButton))
        navigationItem.rightBarButtonItem = rightButtonBar


        callApi()


    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Book Now"
        navigationController?.hidesBarsOnSwipe = false
    }

    func callApi(){
        
        //if let window = UIApplication.shared.keyWindow{
            view.addSubview(activityIndicator)
            
            activityIndicator.activityIndicator.startAnimating()
            activityIndicator.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
       // }
       //
        self.performSelector(inBackground: #selector(getOffersList), with: nil)
        self.performSelector(inBackground: #selector(getRestaruantList), with: nil)
        self.performSelector(inBackground: #selector(getRestaruantMeetingAndEvents), with: nil)
        self.performSelector(inBackground: #selector(getRestaruantPackages), with: nil)
        self.performSelector(inBackground: #selector(getHotelDetails), with: nil)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        floatingContentTableView.removeFromSuperview()
        title = ""
    }



    func setup(){
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        SearchRooms.checkInLabel.setTitle("", for: .normal)
        SearchRooms.checkOutLabel.setTitle("", for: .normal)
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
    }


    func handleRoomDetails(roomId: String?){
        let roomDetailsObj = RoomDetails()
        roomDetailsObj.roomId = roomId
        self.navigationController?.pushViewController(roomDetailsObj, animated: true)
    }


    @objc func handleFloatingButton(){
        //view = Restaurants()

        if let window = UIApplication.shared.keyWindow{
            window.addSubview(floatingContentTableView)


            if #available(iOS 11.0, *){
                floatingContentTableView.anchorWithConstantsToTop(top: window.topAnchor, left: nil, bottom: nil, right: window.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
            }else{
                floatingContentTableView.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: nil, bottom: nil, right: window.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
            }



            floatingContentTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6).isActive = true
            floatingContentTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.2).isActive = true


            let cells = floatingContentTableView.visibleCells

            for cell in cells{
                cell.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
            }

            var delay = 0.0
            for cell in cells{


                UIView.animate(withDuration: delay, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .transitionCurlDown, animations: {
                    cell.transform = .identity
                }, completion: nil)
                delay = delay + 0.2
            }
            
        }

    }


    lazy var floatingContentTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.register(FloatingCell.self, forCellReuseIdentifier: "FloatingCell")
        return tv
    }()


    let calendarButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.setTitle("12/7/2017", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Constants.Appearance.SECONDARYCOLOR
        return btn
    }()

    let searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SEARCH", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        return btn
    }()

    let activityIndicator = ActivityIndicatorView()
   
    

    
    
    
}
