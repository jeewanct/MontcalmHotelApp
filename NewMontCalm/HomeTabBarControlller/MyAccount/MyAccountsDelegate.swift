//
//  MyAccountsDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 21/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension MyAccountMainCell: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountCell", for: indexPath) as! MyAccountCell
        cell.optionValue.text = ["Edit Profile", "My Account Activity", "Past Stay Credit Request", "Reedem Points","Message Center"][indexPath.item]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return profileEditTable.frame.height * 1/5
    }
    
    
}

extension MyAccountMainCell: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0 Clicked")
        case 1:
            parentInstance?.navigationController?.pushViewController(MyAccountActivityController() , animated: true)
//            parent.pushViewController(MyAccountActivityController(collectionViewLayout: layout) , animated: true)
        case 2:
           // navigationItem.title = ""
            parentInstance?.navigationController?.pushViewController(PastStayController(), animated: true)
        case 3:
            print("0 Clicked")
        default:
            print("Clicked")
        }
    }
}




extension MyAccount: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountMainCell", for: indexPath) as! MyAccountMainCell
        cell.parentInstance = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height
    }


    


}

extension MyAccount: UITableViewDelegate{

//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            switch indexPath.row {
//            case 0:
//                print("0 Clicked")
//            case 1:
//                navigationItem.title = ""
//                let layout = UICollectionViewFlowLayout()
//                layout.scrollDirection = .horizontal
//                layout.minimumLineSpacing = 0
//                navigationController?.pushViewController(MyAccountActivityController(collectionViewLayout: layout) , animated: true)
//            case 2:
//                navigationItem.title = ""
//                navigationController?.pushViewController(PastStayController(), animated: true)
//            case 3:
//                print("0 Clicked")
//            default:
//                print("Clicked")
//            }
//        }
}


