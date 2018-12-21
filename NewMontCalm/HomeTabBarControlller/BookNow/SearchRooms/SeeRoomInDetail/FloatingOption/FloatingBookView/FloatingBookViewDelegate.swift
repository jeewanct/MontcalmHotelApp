//
//  FloatingBookViewDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension FloatingBookView: UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let totalRooms = hotelDetailData?.availableRooms{
            return totalRooms.count + 1
        }

        return 0
    }



     func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath){

        if indexPath.item > 0 {

            OpenRoomDetailsDelegate?.handleRoomDetails(roomId: hotelDetailData?.availableRooms?[indexPath.item - 1].roomId)
        }

    }




    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookNowInformationCell", for: indexPath) as! BookNowInformationCell
            cell.selectionStyle = .none
            cell.parentInstance = self
            cell.hotelDetailData = hotelDetailData
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "BookNowHotelListingCell", for: indexPath) as! BookNowHotelListingCell
        cell.selectionStyle = .none
        cell.roomList = hotelDetailData?.availableRooms?[indexPath.item - 1]
        return cell


    }
}

extension FloatingBookView: UITableViewDelegate{


}



extension BookNowInformationCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let size = CGSize(width: UIScreen.main.bounds.width , height: 1000.0)
        let estimatedFrame = NSString(string: ["Hotel Facilities", "Room Amenities", "Attractions", "TV Channels", "Booking Care Charter"][indexPath.item]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15) ], context: nil)



        return CGSize(width: estimatedFrame.width + 32, height: 50)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilityCell", for: indexPath) as! FacilityCell
        cell.facilityLabel.text = ["Hotel Facilities", "Room Amenities", "Attractions", "TV Channels", "Booking Care Charter"][indexPath.item]

        return cell

    }

}


extension BookNowInformationCell: UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath){

        switch(indexPath.item){
        case 0:
            loadStringToWebView(stringToBeLoad: hotelDetailData?.hotelFacilities)
        case 1:
            loadStringToWebView(stringToBeLoad: hotelDetailData?.roomAminities)
        case 2:
            loadStringToWebView(stringToBeLoad: hotelDetailData?.attractions)
        case 3:
            loadStringToWebView(stringToBeLoad: hotelDetailData?.tvChannels)
        default:
            loadStringToWebView(stringToBeLoad: hotelDetailData?.bookingCareCharter)
        }


    }


    func loadStringToWebView(stringToBeLoad: String?){

        guard let knowMoreDetail = stringToBeLoad else{
            return
        }

        webView.loadHTMLString(knowMoreDetail, baseURL: nil)


    }




}

