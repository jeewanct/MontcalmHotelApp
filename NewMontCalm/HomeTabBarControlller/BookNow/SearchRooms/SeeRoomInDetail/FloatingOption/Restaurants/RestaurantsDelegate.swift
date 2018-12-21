//
//  RestaurantsDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension Restaurants: UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let selection = hotelDetailType{

            switch selection {
            case .restaurants:
                return restaurantData?.count ?? 0
            case .meetings:
                return meetingEventsData?.count ?? 0
            case .packages:
                return packageData?.count ?? 0
            default:
                print("hi")
            }




        }



        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        cell.selectionStyle = .none


        if let selection = hotelDetailType{

            switch selection {
            case .restaurants:
                cell.restaurantDetails = restaurantData?[indexPath.item]
            case .meetings:
                cell.meetingDetails = meetingEventsData?[indexPath.item]

            case .packages:
                cell.packageDetails =  packageData?[indexPath.item]
            default:
                print("hi")
            }




        }


        return cell
    }
}

extension Restaurants: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seeRoomInstance?.navigateToOther()
    }
}
