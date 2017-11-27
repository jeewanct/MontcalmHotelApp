//
//  ConfirmStayViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension ConfirmStayViewController{

    func addViews(){

        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Constants.Appearance.PRIMARYCOLOR
        titleLabel.text = "Payment Details"
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont(name: "LATO-REGULAR", size: 20)
        titleLabel.minimumScaleFactor = 0.1

        let informationLabel = UILabel()
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.textColor = Constants.Appearance.PRIMARYCOLOR
        informationLabel.numberOfLines = 2
        informationLabel.textColor = .black
        informationLabel.minimumScaleFactor = 0.1
        informationLabel.adjustsFontSizeToFitWidth = true
        informationLabel.text = "Please enter your information. * Indicates required field."

        view.addSubview(detailView)


        if #available(iOS 11.0, *){
            detailView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        }else{
            detailView.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        }



        detailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true


        detailView.addSubview(titleLabel)
        titleLabel.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.25).isActive = true


        detailView.addSubview(informationLabel)
        informationLabel.anchorWithConstantsToTop(top: titleLabel.bottomAnchor, left: detailView.leftAnchor, bottom: detailView.bottomAnchor, right: detailView.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)



        // Adding Table View
        view.addSubview(informationTableView)
        informationTableView.anchorWithConstantsToTop(top: detailView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        
    }

}


extension ConfirmStayViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmStayCell", for: indexPath) as! ConfirmStayCell
        return cell
    }

}


extension ConfirmStayViewController: UITableViewDelegate{

}
