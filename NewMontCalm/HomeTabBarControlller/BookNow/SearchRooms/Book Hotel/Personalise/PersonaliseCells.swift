//
//  PersonaliseCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//


import UIKit

class PersonliseCell: UICollectionViewCell{

    var personaliseInstance: PersonaliseController?
    var contentData = [false,false,false,false,false,false,false]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSectionClick(cellClicked: Int){
        
        if contentData[cellClicked] == true{
            
            contentData[cellClicked] = false
            contentTable.deleteRows(at: [IndexPath(row: 0, section: cellClicked)], with: .fade)
            
            
            
        }else{
            
            contentData[cellClicked] = true
            contentTable.insertRows(at: [IndexPath(row: 0, section: cellClicked)], with: .fade)
        }
        
    }
    
    
    func addViews(){
        addSubview(contentTable)

        contentTable.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        
    }
    
    lazy var contentTable: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.register(PersonaliseTableCell.self, forCellReuseIdentifier: "PersonaliseTableCell")
        return tv
    }()
    
    
    
}

class PersonaliseTableCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        
        addSubview(selectHotelRoomsButton)
        
        selectHotelRoomsButton.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        selectHotelRoomsButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 1.7).isActive = true
        
        addSubview(priceButton)
        priceButton.anchorWithConstantsToTop(top: topAnchor, left: selectHotelRoomsButton.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 16)
    
        
    }
    


    let selectHotelRoomsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.setTitle("Select Hotel Room(s)", for: .normal)
        return btn
    }()
    
    let priceButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(#colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1), for: .normal)
        btn.setTitle("Per Unit: $200", for: .normal)
        return btn
    }()
}
