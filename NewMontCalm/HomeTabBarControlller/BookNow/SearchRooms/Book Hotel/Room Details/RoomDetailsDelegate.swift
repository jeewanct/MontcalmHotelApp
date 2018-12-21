//
//  RoomDetailsDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


extension RoomDetails: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomDetailsCell", for: indexPath) as! RoomDetailsCell
        cell.selectionStyle = .none
        cell.roomDetailsInstance = self
        cell.roomData = roomData
        return cell
    }
    
}


extension RoomDetails: UITableViewDelegate {
    
}


extension RoomDetailsCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 16)/2 , height: (UIScreen.main.bounds.width - 16)/2 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5

    }


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilitesCollectionCell", for: indexPath) as! FacilitesCollectionCell
        cell.aminityLabel.text = ["Room Facilities", "Room Amenities", "Attractions", "TV Channels", "Booking Care Charter"][indexPath.item]
        cell.aminityImage = [roomData?.roomFacilitiesImage, roomData?.roomAminitiesImage, roomData?.attractionsImage, roomData?.tvChannelsImage, roomData?.bookingCareCharterImage][indexPath.item]
        return cell
    }
}

extension RoomDetailsCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath){

        switch(indexPath.item){
        case 0:
            loadStringToWebView(stringToBeLoad: roomData?.roomFacilities)
        case 1:
            loadStringToWebView(stringToBeLoad: roomData?.roomAminities)
        case 2:
            loadStringToWebView(stringToBeLoad: roomData?.attractions)
        case 3:
            loadStringToWebView(stringToBeLoad: roomData?.tvChannels)
        default:
            loadStringToWebView(stringToBeLoad: roomData?.bookingCareCharter)
        }


    }


    func loadStringToWebView(stringToBeLoad: String?){

        if let window = UIApplication.shared.keyWindow{

            guard let knowMoreDetail = stringToBeLoad else{
                return
            }

            let obj = CustomPopUpViews()
            obj.webView.loadHTMLString(knowMoreDetail, baseURL: nil)
            window.addSubview(obj)
            obj.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)

        }
    }
    
}


extension RoomDetails{

    @objc  func getRoomDetails(){

        guard let unwrapHotelId = roomId else{
            return
        }
        let obj = ViewControllersHTTPRequest()

        obj.getParticularRoomDetails(hotelId: ["roomId": unwrapHotelId], completion: { (data) in

            self.roomData = data
            self.contentTable.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            print("The room details is ", self.roomData?.desc)

        }) { (error) in
            print(error)
        }
    }


}
