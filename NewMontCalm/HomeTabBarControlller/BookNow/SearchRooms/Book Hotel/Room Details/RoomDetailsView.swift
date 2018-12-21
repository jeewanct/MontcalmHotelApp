//
//  RoomDetailsView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension RoomDetails{
    
    func addViews(){
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        bottomView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true



        if #available(iOS 11.0, *){
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide
                .bottomAnchor,constant: 0).isActive = true
        }else{
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
        }

        
        bottomView.addSubview(totalButton)
        totalButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        totalButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.6).isActive = true
        totalButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        totalButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 16).isActive = true
        
        bottomView.addSubview(bookNowButton)
        bookNowButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        bookNowButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.6).isActive = true
        bookNowButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        bookNowButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor,constant: -16).isActive = true
        
        view.addSubview(contentTable)

        if #available(iOS 11.0, *){
            contentTable.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide
                .topAnchor, left: view.leftAnchor, bottom: bottomView.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        }else{
            contentTable.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: bottomView.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        }

        
        
    }
}
