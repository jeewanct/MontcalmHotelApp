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
        return hotelList?.list?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        cell.hotelList = hotelList?.list?[indexPath.item]
        return cell
    }
}


extension Contacts{
    func apiCall(){

        ApiService.shared.postMethod(url: Constants.CustomApis.HOMEURL + Constants.CustomApis.HOTELLIST, bodyParameter: ["checkIn":"2017-10-12","checkOut":"2017-10-13"]) { (data) in



            do{
                // print(try JSONSerialization.jsonObject(with: data, options: .mutableContainers))

                self.hotelList = try JSONDecoder().decode(SearchRoomModel.self, from: data)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }catch _ {

            }

        }

    }
}



