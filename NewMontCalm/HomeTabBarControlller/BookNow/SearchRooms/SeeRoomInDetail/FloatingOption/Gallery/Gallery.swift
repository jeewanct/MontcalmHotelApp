//
//  Gallery.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit




class Gallery: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var photoGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.tag = 0
        cv.showsHorizontalScrollIndicator = false
        cv.register(GalleryCell.self, forCellWithReuseIdentifier: "GalleryCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var photoGallery1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.tag = 1
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(GallerySmallCell.self, forCellWithReuseIdentifier: "GalleryCell1")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    let pager: UIPageControl = {
        let pager = UIPageControl()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.pageIndicatorTintColor = .white
        pager.currentPage = 0
        pager.currentPageIndicatorTintColor = .orange
        pager.numberOfPages = 10
        return pager
    }()
}
