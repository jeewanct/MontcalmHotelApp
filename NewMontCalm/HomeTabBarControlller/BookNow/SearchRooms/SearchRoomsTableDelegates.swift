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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(SeeRoomInDetail(), animated: true)
    }
    
    // MARK: Table View Data Source delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//hotelList?.list?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchRooms", for: indexPath) as! SearchRoomCell
        cell.selectionStyle = .none
        cell.searchRoomInstance = self
       // cell.hotelList = hotelList?.list?[indexPath.item]
        return cell
    }
}

extension SearchRooms{


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


    @objc func handleToggleMap(){
        navigationController?.pushViewController(RoomsMap(), animated: true)
    }

    func call(){

    }

    func uber(){

    }

    func bookNow(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        navigationController?.pushViewController(BookHotelNow(collectionViewLayout: layout), animated: true)
    }
    

}


