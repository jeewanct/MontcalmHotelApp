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
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 94 )
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
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
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

    func handleReservation(){
        navigationController?.pushViewController(ReservationSummary(), animated: true)
    }
    
    func animateMovingView(value: CGFloat){
        collectionView?.scrollToItem(at: IndexPath(item: Int(value), section: 0) , at: .left, animated: true)
    }
}



extension PersonliseCell: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonaliseTableCell", for: indexPath) as! PersonaliseTable
        cell.selectionStyle = .none
        return cell
    }

    
    
}

extension PersonliseCell: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personaliseInstance?.handleReservation()
    }
}
