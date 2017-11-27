//
//  BookTableDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 04/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension BookNow{
    
    
    
    // MARK: Table View Datasource
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 2 // * 0.7 - 49
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.selectionStyle = .none
        cell.bookNowInstance = self
        return cell
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

    func handleSearchRooms(){
        let obj = UINavigationController(rootViewController: SearchRooms())
        self.present(obj, animated: true, completion: nil)
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
}



//MARK: Client changes

extension BookCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ourPropertiesCollectionView.frame.width, height: ourPropertiesCollectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OurPropertiesCell", for: indexPath) as! OurPropertiesCell
        cell.backgroundImageView.image = [#imageLiteral(resourceName: "image0"),#imageLiteral(resourceName: "Image1"),#imageLiteral(resourceName: "Image2"),#imageLiteral(resourceName: "Image3"),#imageLiteral(resourceName: "Image4"),#imageLiteral(resourceName: "image0"),#imageLiteral(resourceName: "Image1"),#imageLiteral(resourceName: "Image2"),#imageLiteral(resourceName: "Image3"),#imageLiteral(resourceName: "Image4")][indexPath.item]
        return cell
    }


}






