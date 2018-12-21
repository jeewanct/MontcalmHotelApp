//
//  SearchRoomsTableDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SearchRooms{
    
    // MARK: Table view delegates
    
    func viewHotelInDetail(hotelId: Int){
        let seeRoomInDetailObj = SeeRoomInDetail()
        seeRoomInDetailObj.hotelId = hotelList?[hotelId].hotelId
        navigationController?.pushViewController(seeRoomInDetailObj, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        viewHotelInDetail(hotelId: indexPath.section)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return hotelList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SearchRoomsHeaderView()
        headerView.hotelImageUrl = hotelList?[section].hotelImageUrl
        headerView.parentInstance = self
        headerView.hotelId = section
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return Constants.StandardSize.TABLEROWHEIGHT 
    }

   
    
    // MARK: Table View Data Source delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//hotelList?.list?.count ?? 0
    }
    
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchRooms", for: indexPath) as! SearchRoomCell
        cell.selectionStyle = .none
        cell.searchRoomInstance = self
        cell.hotelDetail = hotelList?[indexPath.section]
        return cell
    }
}

extension SearchRooms{

    
    
    
    @objc func stopAnimation(){
        
        activityIndicator.close()
    }
    
    @objc func handleApiCall(){
        
    //    print(dates?["checkIn"])
        
        var serverData = [
            "checkIn": "",
            "checKOut": ""
        ]
        
        if let checkInDate = dates?["checkIn"], let checkOutDate = dates?["checkOut"]
        {
            serverData.updateValue(LogicHelper.shared.convertDateToServerFormat(date: checkInDate), forKey: "checkIn")
            serverData.updateValue(LogicHelper.shared.convertDateToServerFormat(date: checkOutDate), forKey: "checkOut")
        }

        
        let obj = ViewControllersHTTPRequest()
        obj.getAvailableHotels(userInfo: serverData, completion: { (data) in
            if let hotelLists = data.hotelList{
                self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
                self.hotelList = hotelLists
            }

            self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }) { (error) in
        }
    }

    

    


    @objc func handleToggleMap(){
        let roomsMapObj = RoomsMap()
        roomsMapObj.hotelList = hotelList
        navigationController?.pushViewController(roomsMapObj, animated: true)

    }

    func call(){

    }


    func bookNow(hotelId: String){

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let obj = BookHotelNow(collectionViewLayout: layout)


        if let checkInDate = dates?["checkIn"], let checkOutDate = dates?["checkOut"]{

            obj.serverBodyData = [
                "checkIn" : LogicHelper.shared.convertDateToServerFormat(date: checkInDate),
                "checkOut" : LogicHelper.shared.convertDateToServerFormat(date: checkOutDate),
                "propertyId" : hotelId
            ]

             navigationController?.pushViewController(obj, animated: true)

        }



    }
    

}


