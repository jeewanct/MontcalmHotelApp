//
//  PersonaliseDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension PersonaliseController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: view.frame.height - 44)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonaliseCell", for: indexPath) as! PersonliseCell
        cell.personaliseInstance = self
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.movingView.transform = CGAffineTransform(translationX: scrollView.bounds.origin.x / 3, y: 0)
        }, completion: nil)
    }
    
    
}

extension PersonaliseController{
    
    @objc func handleEnhancment(){
        animateMovingView(value: 0)
    }
    
    
    @objc func handlearomas(){
        animateMovingView(value: 1)
    }
    
    @objc func handlePillows(){
        animateMovingView(value: 2)
    }

    @objc func handleReservation(){
        navigationController?.pushViewController(ReservationSummary(), animated: true)
    }
    
    func animateMovingView(value: CGFloat){
        collectionView?.scrollToItem(at: IndexPath(item: Int(value), section: 0) , at: .left, animated: true)
    }
}



extension PersonliseCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = EnhancmentHeaderView()
        headerView.headerNumber = section
        headerView.parentInstance = self
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + Constants.StandardSize.TABLEROWHEIGHT * 0.2
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return contentData.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.065
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if contentData[section] == false{
            return 0
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonaliseTableCell", for: indexPath) as! PersonaliseTableCell
        cell.selectionStyle = .none
        return cell
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > CGFloat(0){
            // bookHotelNowInstance?.navigationController?.isNavigationBarHidden = true

            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.personaliseInstance?.containerView.transform = CGAffineTransform(translationX: 0, y: 49)


            }, completion: nil)


            //  bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else{
            // bookHotelNowInstance?.navigationController?.isNavigationBarHidden = false

            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.personaliseInstance?.containerView.transform = .identity

            }, completion: nil)





            // bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        }
    }

    
    
}

extension PersonliseCell: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personaliseInstance?.handleReservation()
    }
}
