
//  SeeRoomInDetailsDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SeeRoomInDetail{
    
//    func addfloatingButton(){
//        
//        if let window = UIApplication.shared.keyWindow{
//            window.addSubview(floatingButton)
//            floatingButton.anchorWithConstantsToTop(top: window.topAnchor, left: nil, bottom: nil, right: window.rightAnchor, topConstant: 28, leftConstant: 0, bottomConstant: 0, rightConstant: 16)
//            floatingButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
//            floatingButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
//        }
//    }
    
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





            print("Frame is ", tableView.cellForRow(at: indexPath)?.frame)

        switch indexPath.item {
        case 0:
            navigate(tempView: Gallery(), navigationTitle: "Gallery")
        case 1:
            navigate(tempView: Restaurants(), navigationTitle: "Meeting & Events")
        case 2:
            navigate(tempView: Restaurants(), navigationTitle: "Packages")
        case 3:
            navigate(tempView: FloatingOffers(), navigationTitle: "Offers")
        case 4:
            let restaurants = Restaurants()
            restaurants.seeRoomInstance = self
            navigate(tempView: restaurants, navigationTitle: "Restaurants")
        default:
            navigate(tempView: FloatingBookView(), navigationTitle: "Book Now")
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



extension BookNowInformationCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == hotelFacilities{
            return CGSize(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height * 0.07)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: Constants.StandardSize.TABLEROWHEIGHT)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == hotelFacilities{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilityCell", for: indexPath) as! FacilityCell
            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        return cell
    }

}


extension BookNowInformationCell: UICollectionViewDelegate{

}
