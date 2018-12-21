//
//  ContactsTableDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension Contacts{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07 //+ UIScreen.main.bounds.height * 0.07
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        cell.hotelList = hotelList?[indexPath.item]
        cell.selectionStyle = .none
        cell.parentInstance = self
        return cell
    }
}


extension Contacts{
    
    
    @objc func stopAnimation(){
        
        activityIndicator.close()
    }
    
    @objc func handleApiCall(){


        let obj = ViewControllersHTTPRequest()
        obj.getHomeContactDetails1(userInfo: [:], completion: { (data) in
            if let hotelLists = data.hotelList{
                self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
                self.hotelList = hotelLists
            }

            self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)

           // self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }) { (error) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
        }





//        let obj = ViewControllersHTTPRequest()
//        obj.getHomeContactDetails(completion: { (data) in
//            if let hotelLists = data.hotelList{
//                self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
//                self.hotelList = hotelLists
//            }
//
//            self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//        }) { (error) in
//            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
//        }
    }


}


extension ContactsCell{

    @objc func handleLocation(){

        let roomsMapObj = RoomsMap()
        roomsMapObj.hotelList = parentInstance?.hotelList
        parentInstance?.navigationController?.pushViewController(roomsMapObj, animated: true)
    }
}


