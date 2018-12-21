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
            cell.roomData = roomTypeData
            cell.bookHotelNowInstance = self
            cell.delegate = self
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RateTypeCell", for: indexPath) as! RateTypeCell
        cell.bookHotelNowInstance = self
        cell.roomsData = rateTypeData
        cell.delegate = self
        return cell

    }
    
    
}


extension BookHotelNowCell: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return roomData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomData?[section].rateType?.count ?? 0 
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomOffers
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.rateData = roomData?[indexPath.section].rateType?[indexPath.item]
        cell.cellItem = indexPath.item
        cell.cellSection = indexPath.section
        cell.delegate = self
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = RoomsHeaderView()
        view.roomImage = roomData?[section].roomImage
        view.roomName = roomData?[section].roomName
        view.cellIndex = section
        view.bookHotelCellIndex = self
        view.backgroundColor = .clear

        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.065 * 2 + UIScreen.main.bounds.height * 0.06 
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

        let cell = collectionView?.cellForItem(at: IndexPath(item: 0, section: 0)) as? BookHotelNowCell


        var rateDetailsInfo = [EnhancmentRoomModel]()


        if let roomData = cell?.roomData{

            for roomIndex in roomData{

                if let rateData = roomIndex.rateType{

                    for rateIndex in rateData{

                        if let numberOfRooms = rateIndex.numberOfRooms{

                            let obj = EnhancmentRoomModel()
                            obj.rateRuleId = rateIndex.rateRuleId
                            obj.isDefaultStatus = "false"
                            obj.rateRuleName = rateIndex.rateName
                            obj.includedPackage = "LightBr"
                            obj.maxAdults = "2"
                            obj.appliedRateRuleId = rateIndex.appliedRateRuleId
                            obj.pmsRateRuleId = rateIndex.pmsRateRuleId
                            obj.roomTypeName = roomIndex.roomName
                            obj.rateRuleType = ""
                            obj.roomTypeId = roomIndex.roomId
                            obj.roomUnit = rateIndex.numberOfRooms


                                var adultPerRoom = [String]()
                                let numberOfRoomInt = String(describing: numberOfRooms.first)
                                let value = Int(numberOfRoomInt)

                                if let getValue = value{
                                    for _ in 1...getValue{
                                        if let maxAdults = obj.maxAdults{
                                            adultPerRoom.append(maxAdults)
                                        }
                                    }
                                    obj.adultPerRoom = adultPerRoom
                                }

                            rateDetailsInfo.append(obj)
                        }


                    }


                }

            

            }


        }

        dump(rateDetailsInfo)

        print("Number of selected rooms ", rateDetailsInfo)








//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        navigationController?.pushViewController(PersonaliseController(collectionViewLayout: layout), animated: true)
    }


    @objc func stopAnimation(){

        activityIndicator.close()
    }


    @objc  func handleApiCall(){


        guard let serverBody = serverBodyData else {
            return
        }

        let obj = ViewControllersHTTPRequest()

        obj.getAvailableHotelRate(userInfo: serverBody, completion: { (data) in

            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            print("the rateTypeData ", data)
            print("the roomTypeData", data.roomTypesRules)

            self.roomTypeData = data.roomTypesRules
            self.rateTypeData = data.rateTypeRules
            self.collectionView?.performSelector(onMainThread: #selector(self.collectionView?.reloadData), with: nil, waitUntilDone: false)

        }) { (error) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
        }
    }


}





extension RateTypeCell: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return roomsData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsData?[section].rooms?.count ?? 0
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "RateTypeTableCell", for: indexPath) as! RateTypeTableCell
        cell.selectionStyle = .none
        cell.roomDetails = roomsData?[indexPath.section].rooms?[indexPath.item]
        cell.cellItem = indexPath.item
        cell.cellSection = indexPath.section
        cell.delegate = self
        return cell

    }

   

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 8
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = RateTypeHeaderView()
        view.cellIndex = section
        view.rateTypeCellIndex = self
        view.rateTypeName = roomsData?[section].rateName
        view.rateImage = roomsData?[section].rateImage
        
        if cellIndex == section{
            view.hotelImage.isHidden = false
        }else{
            view.hotelImage.isHidden = true
        }


        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if let index = cellIndex{
            if section == index{
                print(index)
                return Constants.StandardSize.TABLEROWHEIGHT * 0.5 + UIScreen.main.bounds.height * 0.065 * 2 + 16
            }
        }


        return UIScreen.main.bounds.height * 0.065 * 2 + 16


    }



}



extension RoomOffers: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return returnNumberOfRooms(endingRoomNumber: rateData?.roomUnit).count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.075
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? NumberOfRoomsCell
        rateData?.numberOfRooms = cell?.currencyLabel.text
        roomsButton.setTitle(cell?.currencyLabel.text, for: .normal)
        selectRooms.handleClose()
        delegate?.makeEnhancmentModel(section: cellSection, item: cellItem, rateData: rateData)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberOfRoomsCell", for: indexPath) as! NumberOfRoomsCell
        cell.currencyLabel.text = returnNumberOfRooms(endingRoomNumber: rateData?.roomUnit)[indexPath.item]
        return cell
    }

    func returnNumberOfRooms(endingRoomNumber: String?) -> [String]{

        var roomsNumber = [String]()
        if let numberOfRooms = endingRoomNumber{
            if let lastRoomNumber = Int(numberOfRooms){

                for index in 1...lastRoomNumber{
                    if index == 1{
                        roomsNumber.append("\(index) room")
                    }else{
                        roomsNumber.append("\(index) rooms")
                    }
                }
            }
        }

        return roomsNumber
    }


}






extension RateTypeTableCell: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return returnNumberOfRooms(endingRoomNumber: roomDetails?.roomUnits).count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.075
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? NumberOfRoomsCell
        roomDetails?.numberOfRooms = cell?.currencyLabel.text
        roomsButton.text = cell?.currencyLabel.text
        selectRooms.handleClose()
      //  delegate?.makeEnhancmentModel(section: cellSection, item: cellItem, rateData: rateData)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberOfRoomsCell", for: indexPath) as! NumberOfRoomsCell
        cell.currencyLabel.text = returnNumberOfRooms(endingRoomNumber: roomDetails?.roomUnits)[indexPath.item]
        return cell
    }

    func returnNumberOfRooms(endingRoomNumber: String?) -> [String]{

        var roomsNumber = [String]()
        if let numberOfRooms = endingRoomNumber{
            if let lastRoomNumber = Int(numberOfRooms){

                for index in 1...lastRoomNumber{
                    if index == 1{
                        roomsNumber.append("\(index) room")
                    }else{
                        roomsNumber.append("\(index) rooms")
                    }
                }
            }
        }

        return roomsNumber
    }


}



