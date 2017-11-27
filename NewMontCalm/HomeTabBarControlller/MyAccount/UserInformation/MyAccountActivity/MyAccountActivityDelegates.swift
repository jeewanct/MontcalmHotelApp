//
//  MyAccountActivityDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension MyAccountActivityController: UICollectionViewDelegateFlowLayout{

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        movingView.transform = CGAffineTransform(translationX: scrollView.bounds.origin.x / 2, y: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyAccountActivityCell", for: indexPath) as! MyAccountActivityCell
         cell.parentInstance = self
        return cell
    }
}


extension MyAccountActivityController{
    
    @objc func handleUpcomingBookings(){
        animateMovingView(value: 0)
    }
    
    @objc func handlePreviousBookings(){
        animateMovingView(value: 1)
        
    }
    
    func animateMovingView(value: CGFloat){
        collectionView?.scrollToItem(at: IndexPath(item: Int(value), section: 0) , at: .left, animated: true)
    }
    
}



// My AccountActivity collection view cell delegate

extension MyAccountActivityCell: UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingBookingCell", for: indexPath) as! UpcomingBookingCell
        cell.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        cell.selectionStyle = .none
        cell.parentInstance = parentInstance
        return cell
    }
}


extension MyAccountActivityCell: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentInstance?.navigationController?.pushViewController(UpcomingBookingController(), animated: true)
    }
}
