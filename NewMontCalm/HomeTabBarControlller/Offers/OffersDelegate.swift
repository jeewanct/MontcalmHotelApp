//
//  OffersDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

// Data source
extension Offers {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offersData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersCell", for: indexPath) as! OffersCell
        cell.offersData = offersData?[indexPath.item].offers
        cell.hotelName.text = offersData?[indexPath.item].hotelName
        cell.selectionStyle = .none
        return cell
    }
}



extension OffersCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: Constants.StandardSize.TABLEROWHEIGHT , height: Constants.StandardSize.TABLEROWHEIGHT * 0.8 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersInDetail", for: indexPath) as! OffersViewCell
        cell.offers = offersData?[indexPath.item]
        return cell
    }
}

extension OffersCell: UICollectionViewDelegate {
    
}


extension Offers{
    
    @objc func stopAnimation(){
        activityIndicator.close()
    }
    

    @objc func handleGetOffers(){

        let obj = ViewControllersHTTPRequest()
        obj.getHotelOffers(completion: { (data) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            self.offersData = data.hotels 
            self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)

        }) { (error) in
            print("Error")
        }


    }
}
