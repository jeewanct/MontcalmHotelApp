//
//  MyAccountActivityDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 28/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

// Data Source
extension MyAccountActivityController{

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }

        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountActivityFilterCell", for: indexPath) as! MyAccountActivityFilterCell
            cell.selectionStyle = .none
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountActivityCell", for: indexPath) as! MyAccountActivityCell
        cell.selectionStyle = .none
        return cell
    }

    
    
}


// Delegates
extension MyAccountActivityController{
    
}

