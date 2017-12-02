//
//  BookHotelDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension BookHotelNow: UICollectionViewDelegateFlowLayout{
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let translationX = scrollView.bounds.origin.x / 3
        UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.movingView.transform = CGAffineTransform(translationX: translationX, y: 0)
        }, completion: nil)
        

        
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookHotelNowCell", for: indexPath) as! BookHotelNowCell
            cell.bookHotelNowInstance = self
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RateTypeCell", for: indexPath) as! RateTypeCell
        cell.bookHotelNowInstance = self
        return cell


    }
    
    
}


extension BookHotelNowCell: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let index = cellIndex{
            if indexPath.section == index{
                print(index)
                return UIScreen.main.bounds.height * 0.3 * 0.3
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomOffers
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = RoomsHeaderView()
        view.cellIndex = section
        view.bookHotelCellIndex = self
        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07 
    }



    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > CGFloat(0){
           // bookHotelNowInstance?.navigationController?.isNavigationBarHidden = true

            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                 self.bookHotelNowInstance?.containerView.transform = CGAffineTransform(translationX: 0, y: 49)
                

            }, completion: nil)


            



            
            //  bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else{
           // bookHotelNowInstance?.navigationController?.isNavigationBarHidden = false

            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.bookHotelNowInstance?.containerView.transform = .identity

            }, completion: nil)





            // bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        }
    }



}


extension BookHotelNow{
    
    
    @objc func handleComparePrices(){
        // Remove this code
        navigationController?.pushViewController(RoomDetails(), animated: true)
    }


    @objc func handleRoomButton(){
        movingViewAnimation(content: 0)
        
    }

    @objc func handlerateButton(){
        movingViewAnimation(content: 1)
    }

    @objc func handleflexible(){
        movingViewAnimation(content: 2)
    }


    func movingViewAnimation(content: Int){
        collectionView?.scrollToItem(at: IndexPath(item: content, section: 0), at: .left, animated: true)
    }
    
    
}

extension BookHotelNow{
    @objc func handleBookNow(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        navigationController?.pushViewController(PersonaliseController(collectionViewLayout: layout), animated: true)
    }
}





extension RateTypeCell: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let index = cellIndex{
            if indexPath.section == index{
                print(index)
                return Constants.StandardSize.TABLEROWHEIGHT
            }
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateTypeTableCell", for: indexPath) as! RateTypeTableCell
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 16
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = RateTypeHeaderView()
        view.cellIndex = section
        view.rateTypeCellIndex = self
        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height * 0.07
    }



//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if velocity.y > CGFloat(0){
//            bookHotelNowInstance?.navigationController?.isNavigationBarHidden = true
//            bookHotelNowInstance?.containerView.isHidden = true
//            //  bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }else{
//            bookHotelNowInstance?.navigationController?.isNavigationBarHidden = false
//            bookHotelNowInstance?.containerView.isHidden = false
//            // bookHotelNowInstance?.collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
//        }
//    }
}
