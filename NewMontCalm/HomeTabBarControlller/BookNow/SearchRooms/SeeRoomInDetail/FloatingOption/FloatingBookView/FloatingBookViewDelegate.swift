//
//  FloatingBookViewDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension FloatingBookView: UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {



            if indexPath.item == 0 {
                return UIScreen.main.bounds.height * 0.07 * 2  + UIScreen.main.bounds.height * 0.3 + 16 * 4 + Constants.StandardSize.TABLEROWHEIGHT
            }
                return Constants.StandardSize.TABLEROWHEIGHT



    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



            if indexPath.item == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookNowInformationCell", for: indexPath) as! BookNowInformationCell
                cell.selectionStyle = .none

                return cell
            }


                let cell = tableView.dequeueReusableCell(withIdentifier: "BookNowHotelListingCell", for: indexPath) as! BookNowHotelListingCell
                return cell






    }
}

extension FloatingBookView: UITableViewDelegate{


}
