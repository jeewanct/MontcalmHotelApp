//
//  BookTableDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 04/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension BookNow{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return homeCell
    }
    
}


extension BookNow {
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -UIScreen.main.bounds.height * 0.3, width: tableView.bounds.width, height: UIScreen.main.bounds.height * 0.3 )
        if tableView.contentOffset.y < -UIScreen.main.bounds.height * 0.3{
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }


    // MARK: Delegates

    func goToCalendar(){
        self.present(CalendarController(), animated: true, completion: nil)
    }

    @objc func handleSearchRooms(){
        let obj = SearchRooms()
        obj.dates = dates
        navigationController?.pushViewController(obj, animated: true)

    }

    
    func handleLoginRegister(){
        navigationController?.pushViewController(LoginRegister(), animated: true)
    }
    
    
}

extension BookCell: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        promoText.resignFirstResponder()
        return true
    }

    @objc func handlePrivacyStatments(){

        if let window = UIApplication.shared.keyWindow{

            let customPopUp = CustomPopUpViews()
            window.addSubview(customPopUp)
            customPopUp.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        }
    }
}



//MARK: Client changes

extension BookCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
        
        if let getHotelName = hotelList?[indexPath.section].hotelName{
            
            let estimatedFrame = NSString(string: getHotelName).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15) ], context: nil)
            return CGSize(width: UIScreen.main.bounds.width - 32 , height: estimatedFrame.height * 2 + 72 + estimatedFrame.height * 0.5 * 2 + Constants.StandardSize.TABLEROWHEIGHT  )
        }
        
        return CGSize(width: UIScreen.main.bounds.width - 32, height: Constants.StandardSize.TABLEROWHEIGHT)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OurPropertiesCell", for: indexPath) as! OurPropertiesCell
        cell.hotelDetail = hotelList?[indexPath.item]
        return cell
    }
    


}






