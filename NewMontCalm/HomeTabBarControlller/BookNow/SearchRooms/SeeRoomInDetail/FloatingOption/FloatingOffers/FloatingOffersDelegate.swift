//
//  FloatingOffersDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 30/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

import UIKit

extension FloatingOffers: UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT + UIScreen.main.bounds.height * 0.07
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offersList?.count ?? 0 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloatingOffersCell", for: indexPath) as! FloatingOffersCell
        cell.selectionStyle = .none
        cell.offersDetails = offersList?[indexPath.item]
        return cell
    }
}

extension FloatingOffers: UITableViewDelegate{

}
