//
//  UpcomingBookingDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 22/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension UpcomingBookingController: UITableViewDataSource{
// Datasource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {


        if indexPath.section == 0 || indexPath.section == 3 ||  section == indexPath.section{
            return 44
        }
        return 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UpcomingBookingHeader()
        headerView.section = section
        headerView.upcomingInstance = self
        if section == 0 || section == 3{
            headerView.downImage.isHidden = true
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingBooking", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension UpcomingBookingController: UITableViewDelegate{


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
