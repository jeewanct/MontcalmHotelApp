//
//  SocialNetworkingView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SocialNetworkingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        addViews()
    }

    func addViews(){

        let findthemontcalmLabel = UILabel()
        findthemontcalmLabel.translatesAutoresizingMaskIntoConstraints = true
        findthemontcalmLabel.text = "Find The Montlm Elsewhere:"
        findthemontcalmLabel.textAlignment = .center
        findthemontcalmLabel.font = UIFont(name: findthemontcalmLabel.font.fontName, size: 14)

        addSubview(findthemontcalmLabel)
        findthemontcalmLabel.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        findthemontcalmLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findthemontcalmLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        addSubview(socialNetworkingCollectionView)


        socialNetworkingCollectionView.topAnchor.constraint(equalTo: findthemontcalmLabel.bottomAnchor, constant: 8).isActive = true
        socialNetworkingCollectionView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        socialNetworkingCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        socialNetworkingCollectionView.widthAnchor.constraint(equalToConstant: 20 * 4 + 16 * 3 ).isActive = true



    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var socialNetworkingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(SocialNetworkingCell.self, forCellWithReuseIdentifier: "SocialNetworkingCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

}

class SocialNetworkingCell: UICollectionViewCell{

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
    }

    func addViews(){
        addSubview(socialIconImageView)
        socialIconImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let socialIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

}


extension SocialNetworkingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialNetworkingCell", for: indexPath) as!
        SocialNetworkingCell
        cell.socialIconImageView.image = [#imageLiteral(resourceName: "facebookIcon").withRenderingMode(.alwaysOriginal), #imageLiteral(resourceName: "youtubeIcon").withRenderingMode(.alwaysOriginal),#imageLiteral(resourceName: "twitterIcon").withRenderingMode(.alwaysOriginal), #imageLiteral(resourceName: "linkedInIcon").withRenderingMode(.alwaysOriginal)] [indexPath.item]
        return cell
    }



}
