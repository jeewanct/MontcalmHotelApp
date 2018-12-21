//
//  SearchRoomsHeaderView.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 03/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SearchRoomsHeaderView: UIView {

    var parentInstance: SearchRooms?
    var hotelId: Int?
    
    
    var hotelImageUrl: String?{
        didSet{

            if let imageUrl = hotelImageUrl, let imageUrlRequest = URL(string: imageUrl){
                hotelImage.pin_updateWithProgress = true
                hotelImage.pin_setImage(from: imageUrlRequest)
            }

        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews(){
        
        let cardView = CardView()
        addSubview(cardView)
        
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        
        addSubview(hotelImage)
        hotelImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
    }
    
    
    @objc func searchRooms(){
        guard let getHotelId = hotelId else {
            return
        }
        parentInstance?.viewHotelInDetail(hotelId: getHotelId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var hotelImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchRooms)))
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()
    
    
}
