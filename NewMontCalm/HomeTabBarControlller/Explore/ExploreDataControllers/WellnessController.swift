//
//  WellnessController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 14/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class WellnessController: ExploreSelectionController{

    var wellnessData: [WellnessHotels]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        setupController()
    }

    func setupController(){
        tableView.delegate = self
        tableView.dataSource = self
        title = "Wellness"
    }
    
    func callApi(){
        
        if let window = UIApplication.shared.keyWindow{
            
            window.addSubview(activityIndicator)
            activityIndicator.activityIndicator.startAnimating()
            activityIndicator.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        
        }
        
       self.performSelector(inBackground: #selector(handleGetWellness), with: nil)
        
    }
    let activityIndicator = ActivityIndicatorView()

}


extension WellnessController{

    
    @objc func stopAnimation(){
        
        activityIndicator.close()
    }
    
    @objc func handleGetWellness(){

        let obj = ViewControllersHTTPRequest()
        obj.getOffersWellness(completion: { (data) in
            print("The offer data is ", data)
            self.wellnessData = data.hotels
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }) { (error) in
            print("Error")
        }
    }

}




extension WellnessController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wellnessData?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreSelectionCell", for: indexPath) as! ExploreSelectionCell
        cell.offersCollectionView.delegate = self
        cell.offersCollectionView.dataSource = self
        cell.hotelNameString = wellnessData?[indexPath.item].hotelName
        return cell
    }
}

extension WellnessController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.StandardSize.TABLEROWHEIGHT , height: Constants.StandardSize.TABLEROWHEIGHT * 0.8 )
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wellnessData?[section].restaurants?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreSelectionCollectionCell", for: indexPath) as! ExploreSelectionCollectionCell
        cell.offerHeadingString = wellnessData?[indexPath.section].restaurants?[indexPath.item].name
        cell.offerImageString = wellnessData?[indexPath.section].restaurants?[indexPath.item].imageUrl
        cell.knowMoreString = wellnessData?[indexPath.section].restaurants?[indexPath.item].longDesc
        return cell
    }
}
