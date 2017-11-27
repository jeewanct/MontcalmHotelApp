//
//  RoomsTableHeader.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class RoomsHeaderView: UITableViewHeaderFooterView{
    var cellIndex: Int?
    var bookHotelCellIndex: BookHotelNowCell?
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(backgroundImage)
        backgroundImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        backgroundImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap(){
        
        
        print("tap Gesture")
        guard let index = cellIndex else { return }
        if index == bookHotelCellIndex?.cellIndex ?? -1{
            bookHotelCellIndex?.cellIndex = -1
            DispatchQueue.main.async {
                self.bookHotelCellIndex?.contentTable.reloadData()
                //self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .top )
            }
        }else{
            bookHotelCellIndex?.cellIndex = index
            
            DispatchQueue.main.async {
                
                self.bookHotelCellIndex?.contentTable.reloadData()
                // self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .bottom )
                //self.bookHotelCellIndex?.contentTable.reloadData()
            }
        }
        
    }
    
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
}

import UIKit

class RateTypeHeaderView: UIView{
    var cellIndex: Int?
    var rateTypeCellIndex: RateTypeCell?


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
        backgroundColor = .white
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc func handleTap(){
        print("tap Gesture")
        guard let index = cellIndex else { return }
        if index == rateTypeCellIndex?.cellIndex ?? -1 {
            rateTypeCellIndex?.cellIndex = -1
            DispatchQueue.main.async {
                self.rateTypeCellIndex?.contentTable.reloadData()
                //self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .top )
            }
        }else{
            rateTypeCellIndex?.cellIndex = index

            DispatchQueue.main.async {

                self.rateTypeCellIndex?.contentTable.reloadData()
                // self.bookHotelCellIndex?.contentTable.reloadRows(at: [IndexPath(item: 0, section: index),IndexPath(item: 1, section: index) ], with: .bottom )
                //self.bookHotelCellIndex?.contentTable.reloadData()
            }
        }



    }

    func addViews(){


        let knowMoreTitle = NSAttributedString(string: "Know More", attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue, NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR] )

        knowMoreButton.setAttributedTitle(knowMoreTitle, for: .normal)


        addSubview(rateTitle)
        rateTitle.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        rateTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true


        addSubview(knowMoreButton)
        knowMoreButton.anchorWithConstantsToTop(top: topAnchor, left: rateTitle.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0)


        let nextImage = UIImageView()
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)



        addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        nextImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        nextImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true


    }

    let rateTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rooms With A Square View -"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        return lbl
    }()

    let knowMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        return btn
    }()




}


