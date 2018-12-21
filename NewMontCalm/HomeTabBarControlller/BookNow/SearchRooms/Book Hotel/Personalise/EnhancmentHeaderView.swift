//
//  EnhancmentHeaderView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 29/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class EnhancmentHeaderView: UIView {

    var headerNumber: Int?
    var parentInstance: PersonliseCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        //translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }

    func addViews(){


        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        
        cardView.addSubview(headerImage)
        headerImage.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        headerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true

        let blackView = BlackView()
        cardView.addSubview(blackView)
        blackView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        blackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true

//        cardView.addSubview(enhancmentTitle)
//        enhancmentTitle.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: headerImage.topAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        
    
        cardView.addSubview(titleContainer)
        titleContainer.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: headerImage.topAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)



        titleContainer.addSubview(enhancmentTitle)
        enhancmentTitle.anchorWithConstantsToTop(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: titleContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0)

        titleContainer.addSubview(rightImageView)
        rightImageView.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor).isActive = true
        rightImageView.heightAnchor.constraint(equalTo: titleContainer.heightAnchor, multiplier: 0.4).isActive = true
        rightImageView.widthAnchor.constraint(equalTo: titleContainer.heightAnchor, multiplier: 0.4).isActive = true
        rightImageView.rightAnchor.constraint(equalTo: titleContainer.rightAnchor, constant: -8).isActive = true






        cardView.addSubview(detailsTitle)
        detailsTitle.anchorWithConstantsToTop(top: nil, left: headerImage.leftAnchor, bottom: headerImage.bottomAnchor, right: headerImage.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8)

    }
    
    
    @objc func handleTapGes(){
        if let cellClicked = headerNumber {
            parentInstance?.handleSectionClick(cellClicked: cellClicked)
        }
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let enhancmentTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Enhancement 1"
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    let detailsTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I can be your hero baby No body wana see us together we can make the world cry belongs to this"
        lbl.numberOfLines = 0
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()


    let headerImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    let rightImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysTemplate)
        iv.tintColor = .black
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGes)))
        return view
    }()
}
