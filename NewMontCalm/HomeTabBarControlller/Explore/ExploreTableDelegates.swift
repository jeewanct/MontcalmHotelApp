//
//  ExploreTableDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension Explore{
    
    
    func parallaxOffset(newOffset: CGFloat, cell: UITableViewCell) -> CGFloat{
        return (newOffset - cell.frame.origin.y) / parllaxImageHeight * parllaxOffsetSpeecd

    }
    
    
    // MARK: TableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected at index", indexPath.item)
        self.present(UINavigationController(rootViewController:Offers()), animated: true, completion: nil)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells as! [ExploreCell]{
            cell.imageTop?.constant = parallaxOffset(newOffset: tableView.contentOffset.y, cell: cell)
        }
    }
    
    // MARK: TableView datasource



    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.StandardSize.TABLEROWHEIGHT
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreCell", for: indexPath) as? ExploreCell {
            cell.exploreImage.image = [#imageLiteral(resourceName: "image0"),#imageLiteral(resourceName: "Image1"),#imageLiteral(resourceName: "Image2"),#imageLiteral(resourceName: "Image3"),#imageLiteral(resourceName: "Image4"),#imageLiteral(resourceName: "image0"),#imageLiteral(resourceName: "Image1"),#imageLiteral(resourceName: "Image2"),#imageLiteral(resourceName: "Image3"),#imageLiteral(resourceName: "Image4")][indexPath.item]
            cell.imageHeading.text = "Restaurants"
            cell.imageHeight?.constant = self.parllaxImageHeight
            cell.imageTop?.constant = parallaxOffset(newOffset: tableView.contentOffset.y, cell: cell)
            return cell
        }

        return ExploreCell()

    }

}

