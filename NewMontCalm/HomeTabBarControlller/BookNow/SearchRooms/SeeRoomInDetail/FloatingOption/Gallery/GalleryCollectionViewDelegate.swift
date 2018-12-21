//
//  GalleryCollectionViewDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 03/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension Gallery: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func addViews(){
        addSubview(photoGallery)
        photoGallery.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        addSubview(photoGallery1)
        photoGallery1.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        photoGallery1.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        
        return CGSize(width: UIScreen.main.bounds.width / 3.5 , height: UIScreen.main.bounds.width / 4)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? GalleryCell{
                cell.galleryImage = galleryData?[indexPath.item].imageUrl
                cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return cell
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell1", for: indexPath) as? GallerySmallCell{
                cell.galleryImage = galleryData?[indexPath.item].imageUrl
                cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                return cell
            }
        }
        return GalleryCell()
        
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            photoGallery.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}
