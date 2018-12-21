//
//  CurrencyView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


class CurrencyView: UIView {




    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
        addViews()

    }


    override func draw(_ rect: CGRect) {
            whiteView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.whiteView.transform = .identity
        }, completion: nil)
        
    }
    
    
    func addViews(){

        
        addSubview(whiteView)
        whiteView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        whiteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        whiteView.addSubview(searchBar)

        searchBar.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

        whiteView.addSubview(contentTable)
        contentTable.anchorWithConstantsToTop(top: searchBar.bottomAnchor, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        addSubview(closeButton)
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: 16).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

    }


    @objc func handleClose(){
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
             self.whiteView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height   )
            
        }) { (value) in
            self.whiteView.transform = .identity
            self.removeFromSuperview()
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .black
        return searchBar
    }()

    lazy var contentTable: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.rowHeight = UITableViewAutomaticDimension
        tv.register(CurrencyCell.self, forCellReuseIdentifier: "CurrencyCell")
        return tv
    }()

    lazy var closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        btn.setImage(#imageLiteral(resourceName: "popUpClose").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

}



extension BookCell: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if buttonValue == 0 {
            return hotelSearchResult?.count ?? 0
        }
        return currencySearchResult?.count ?? 0

    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height * 0.065
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        if buttonValue == 0{
            cell.currencyName = hotelSearchResult?[indexPath.item].hotelName
        }else{
            cell.currencyName = currencySearchResult?[indexPath.item].title
        }
        
        return cell
    }


}

extension BookCell: UISearchBarDelegate, UISearchDisplayDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if buttonValue == 0 {
            
            
            hotelSearchResult = searchText.isEmpty ? hotelList : hotelList?.filter({ (hotel) -> Bool in
                return hotel.hotelName?.range(of: searchText, options: .caseInsensitive) != nil
            })
            
            
        }else{
            currencySearchResult = searchText.isEmpty ? currencyList : currencyList?.filter({ (currency) -> Bool in
                return currency.title?.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
        
        

       currencyView.contentTable.reloadData()

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


class CurrencyCell: UITableViewCell{

    
    
    var currencyName: String?{
        didSet{
        currencyLabel.text = currencyName
        }
    }

    //MARK: Intialization of view
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    func addViews(){
        addSubview(currencyLabel)
        currencyLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let currencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        return lbl
    }()
}
