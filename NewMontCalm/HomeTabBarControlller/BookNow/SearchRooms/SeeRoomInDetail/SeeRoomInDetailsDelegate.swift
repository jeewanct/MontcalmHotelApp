
//  SeeRoomInDetailsDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SeeRoomInDetail{
    
}

extension SeeRoomInDetail: UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {


        return UIScreen.main.bounds.height * 0.6 / 6


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloatingCell", for: indexPath) as! FloatingCell
        cell.detailTextLabel?.text = ["Gallery", "Meeting & Events", "Packages", "Offers", "Restaurants", "Book Now"][indexPath.item]
        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        return cell
    }
}

extension SeeRoomInDetail: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        switch indexPath.item {
        case 0:
            let obj = Gallery()
            obj.galleryData = hotelDetailData?.gallery
            navigate(tempView: obj, navigationTitle: "Gallery")
        case 1:
            let meetings = Restaurants()
            meetings.meetingEventsData = meetingsData
            meetings.hotelDetailType = ExploreSelectionEnum.meetings
            navigate(tempView: meetings, navigationTitle: "Meeting & Events")
        case 2:
            let packages = Restaurants()
            packages.packageData = packageData
            packages.hotelDetailType = ExploreSelectionEnum.packages
            navigate(tempView: packages, navigationTitle: "Packages")
        case 3:
            let offersObject = FloatingOffers()
            offersObject.offersList = self.offersData
            navigate(tempView: offersObject, navigationTitle: "Offers")
        case 4:
            let restaurants = Restaurants()
            restaurants.seeRoomInstance = self
            restaurants.restaurantData = restaurantBarData
            restaurants.hotelDetailType = ExploreSelectionEnum.restaurants
            navigate(tempView: restaurants, navigationTitle: "Restaurants")
        default:
            let obj = FloatingBookView()
            obj.hotelDetailData = self.hotelDetailData
            obj.OpenRoomDetailsDelegate = self
            self.view = obj
            navigate(tempView: obj, navigationTitle: "Book Now")
        }
    
    }

    func navigate(tempView: UIView, navigationTitle: String){

        navigationItem.title = navigationTitle
        floatingContentTableView.removeFromSuperview()
        view = tempView

    }
    
    func navigateToOther(){
        navigationController?.pushViewController(RestaurantDetailController(), animated: true)
    }
}






// APi calls

extension SeeRoomInDetail{

    @objc  func getOffersList(){

        guard let unwrapHotelId = hotelId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getOffersParticularHotel(hotelId: ["hotel_id": unwrapHotelId], completion: { (data) in


            self.offersData = data.hotels?[0].offers // Change this


        }) { (error) in
            print(error)
        }
    }

    @objc  func getRestaruantList(){

        guard let unwrapHotelId = hotelId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getRestaurantAndBarsParticularHotel(hotelId: ["hotel_id": unwrapHotelId], completion: { (data) in


            if let restaurants = data.hotels{
                if restaurants.count > 0 {
                     self.restaurantBarData = data.hotels?[0].restaurants
                }
            }


            print("The restaurant list is", self.restaurantBarData)

        }) { (error) in
            print(error)
        }
    }


    @objc  func getRestaruantMeetingAndEvents(){

        guard let unwrapHotelId = hotelId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getMettingAndEventsParticularHotel(hotelId: ["hotel_id": unwrapHotelId], completion: { (data) in


            if let meeting = data.hotels{
                if meeting.count > 0 {
                    self.meetingsData = data.hotels?[0].meetings
                }
            }


            print("The restaurant list is", self.restaurantBarData)

        }) { (error) in
            print(error)
        }
    }

    
    @objc  func getRestaruantPackages(){

        guard let unwrapHotelId = hotelId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getPackagesParticularHotel(hotelId: ["hotel_id": unwrapHotelId], completion: { (data) in


            if let packages = data.hotels{
                if packages.count > 0 {
                    self.packageData = packages[0].packages
                }
            }



        }) { (error) in
            print(error)
        }
    }

    @objc func stopAnimation(){
        activityIndicator.close()
    }

    @objc  func getHotelDetails(){

        guard let unwrapHotelId = hotelId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getParticularHotelDetails(hotelId: ["propertyId": unwrapHotelId], completion: { (data) in

            self.hotelDetailData = data
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            DispatchQueue.main.async{
                let obj = FloatingBookView()
                obj.hotelDetailData = self.hotelDetailData
                obj.OpenRoomDetailsDelegate = self
                self.view = obj
            }
            print("The hotel details is ", self.hotelDetailData)

        }) { (error) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
        }
    }



}
