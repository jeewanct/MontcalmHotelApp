//
//  Explore.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class Explore: UITableViewController {
    
    var parllaxOffsetSpeecd: CGFloat = 70
    var cellHeight: CGFloat = 250
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func setup(){
        tableView.register(ExploreCell.self, forCellReuseIdentifier: "ExploreCell")
        tableView.rowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Explore"
        
        
       // self.edgesForExtendedLayout = [.bottom]
        //self.hidesBottomBarWhenPushed = true
    }
    
    var parllaxImageHeight:CGFloat{
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parllaxOffsetSpeecd * self.tableView.frame.height) - cellHeight) / 2
        return maxOffset + self.cellHeight
    }
    
    
    
}













