//
//  SelectedHotelCollectionView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 04/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SelectedHotelCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{

    var hotelList: [ListOfAvailableHotels]?
   

    var parentInstance: RoomsMap?
    var newPage1 = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return hotelList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedHotelCell", for: indexPath)  as! SelectedHotelCell

        cell.hotelDetails = hotelList?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 64 , height: Constants.StandardSize.TABLEROWHEIGHT + 64)
    }
    
    
    
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(UIScreen.main.bounds.width - 64 + 10 )                                                    //Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(self.contentSize.width)                                                                           //Float(collectionView!.contentSize.width  )
        var newPage = Float(newPage1)

        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0

            print("if x == 0 ", newPage)
        } else {
            newPage = Float(velocity.x > 0 ? newPage1 + 1 : newPage1 - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }


       // parentController?.handleCoordinateChanges(index: newPage1)
        newPage1 = Int(newPage)
        parentInstance?.handleMapAdjustment(hotelValue: newPage1)

        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
        print("new Page --->",newPage)
        print("new Page1---->", newPage1)



        let index = IndexPath(item: newPage1, section: 0)
        let mainCell = self.cellForItem(at: index) as? SelectedHotelCell


        UIView.animate(withDuration: 0.4, animations: {
            mainCell?.topLayout.constant = 0
            mainCell?.bottomLayout.constant = -32
            self.layoutIfNeeded()
        })



        if newPage1 == 0 || newPage1 == hotelList?.count ?? 0 || newPage1 == (hotelList?.count)! + 1  {
            if newPage1 == 0{
                let index = IndexPath(item: newPage1 + 1, section: 0)
                let cell = self.cellForItem(at: index) as? SelectedHotelCell

                UIView.animate(withDuration: 0.4, animations: {
                    cell?.topLayout.constant = 32
                    cell?.bottomLayout.constant = 0
                    self.layoutIfNeeded()
                })


            }else if newPage1 == 9{
                let index = IndexPath(item: newPage1 - 1, section: 0)
                let cell = self.cellForItem(at: index) as? SelectedHotelCell
                UIView.animate(withDuration: 0.4, animations: {
                    cell?.topLayout.constant = 32
                    cell?.bottomLayout.constant = 0
                    self.layoutIfNeeded()

                })

            }else{
                let index = IndexPath(item: newPage1 - 1, section: 0)
                let mainCell = self.cellForItem(at: index) as? SelectedHotelCell
                UIView.animate(withDuration: 0.4, animations: {
                    mainCell?.topLayout.constant = 0
                    mainCell?.bottomLayout.constant = -32
                    self.layoutIfNeeded()
                })

            }
        }else {
            let index = IndexPath(item: newPage1 + 1, section: 0)
            let index1 = IndexPath(item: newPage1 - 1, section: 0)
            let cell = self.cellForItem(at: index) as? SelectedHotelCell
            let cell1 = self.cellForItem(at: index1) as? SelectedHotelCell

            UIView.animate(withDuration: 0.4, animations: {
                cell?.topLayout.constant = 32
                cell1?.topLayout.constant = 32

                cell1?.bottomLayout.constant = 0
                cell?.bottomLayout.constant = 0
                self.layoutIfNeeded()
            })


        }
        
    }


    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }

    override func draw(_ rect: CGRect) {
        let index = IndexPath(item: 1, section: 0)
        let cell = self.cellForItem(at: index) as? SelectedHotelCell

        let index1 = IndexPath(item: 0, section: 0)
        let cell1 = self.cellForItem(at: index1) as? SelectedHotelCell

        cell1?.topLayout.constant = 0
        cell1?.bottomLayout.constant = -32


        cell?.topLayout.constant = 32
        cell?.bottomLayout.constant = 0
    }

    
    func setup(){
        //self.isScrollEnabled = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        translatesAutoresizingMaskIntoConstraints = false
        self.register(SelectedHotelCell.self, forCellWithReuseIdentifier: "SelectedHotelCell")
        // self.isPagingEnabled = true
        backgroundColor = .clear
        delegate = self
        dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class SelectedHotelCell: UICollectionViewCell{

    var topLayout: NSLayoutConstraint!
    var bottomLayout: NSLayoutConstraint!
    var hotelDetails: ListOfAvailableHotels?{

        didSet{
            hotelNameText.text = hotelDetails?.hotelName
            locationLabel.text = hotelDetails?.hotelAddress
            if let imageUrl = hotelDetails?.hotelImageUrl, let imageUrlRequest = URL(string: imageUrl){
                backgroundImage.pin_updateWithProgress = true
                backgroundImage.pin_setImage(from: imageUrlRequest)
            }

            if let rating = hotelDetails?.hotelRating{
                var ratingString = String()
                if let starRating = Double(rating) {
                    for _ in 1...Int(starRating){
                        ratingString.append("★")
                    }
                     starRatingLabel.attributedText = starRatingLabel.convertAttributeString(firstString: "Star Rating ", secondString: ratingString, firstColor: #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1), secondColor: .white)

                }

            }
        }

    }



    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setData(){




    }
    func setup(){
        backgroundColor = .clear

        addSubview(backgroundImage)

        backgroundImage.anchorToTop(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor)
        topLayout = backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 32)


        bottomLayout = backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        topLayout.isActive = true
        bottomLayout.isActive = true

        let blackView = BlackView()
        backgroundImage.addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)




        backgroundImage.addSubview(hotelNameText)
        hotelNameText.anchorWithConstantsToTop(top: backgroundImage.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        // add buttons
        addSubview(bookNowButton)
        bookNowButton.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: backgroundImage.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        bookNowButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bookNowButton.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        callButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true

        backgroundImage.addSubview(starRatingLabel)
        starRatingLabel.anchorWithConstantsToTop(top: hotelNameText.bottomAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 4, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        backgroundImage.addSubview(locationLabel)
        locationLabel.anchorWithConstantsToTop(top: starRatingLabel.bottomAnchor, left: backgroundImage.leftAnchor, bottom: callButton.topAnchor, right: backgroundImage.rightAnchor, topConstant: 4, leftConstant: 16, bottomConstant: 4, rightConstant: 16)

        
    }


    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()


    let callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("CALL", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    

    
    lazy var bookNowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.setTitle("BOOK NOW", for: .normal)
        //btn.addTarget(self, action: #selector(searchRooms), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let hotelNameText: UILabel = {
        let lbl = UILabel()
        lbl.text = "The Montcalm London Marble Arch"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()

    let locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Star Rating ★★★★★"
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 2
        lbl.font = UIFont(name: lbl.font.fontName, size: 13)
        return lbl
    }()

    let starRatingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Star Rating ★★★★★"
        lbl.font = UIFont(name: lbl.font.fontName, size: 13)
        return lbl
    }()
    
}

