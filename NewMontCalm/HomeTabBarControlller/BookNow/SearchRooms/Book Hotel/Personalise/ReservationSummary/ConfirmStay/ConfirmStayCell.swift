//
//  ConfirmStayCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ConfirmStayCell: UITableViewCell{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addViews()

    }

    func addViews(){

        let titleLabel = tempLabels(title: "Title")
        addSubview(titleLabel)

        let firstNameLabel = tempLabels(title: "First Name")
        addSubview(firstNameLabel)

        let lastNameLabel = tempLabels(title: "Last Name")
        addSubview(lastNameLabel)

        let emailLabel = tempLabels(title: "Email")
        addSubview(emailLabel)

        let phoneLabel = tempLabels(title: "Phone")
        addSubview(phoneLabel)

        let birthdayLabel = tempLabels(title: "Date Of Birth")
        addSubview(birthdayLabel)




        titleLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        firstNameLabel.anchorWithConstantsToTop(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        lastNameLabel.anchorWithConstantsToTop(top: firstNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        lastNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true


        emailLabel.anchorWithConstantsToTop(top: lastNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        phoneLabel.anchorWithConstantsToTop(top: emailLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        phoneLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        birthdayLabel.anchorWithConstantsToTop(top: phoneLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        birthdayLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true


    }

    func tempLabels(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let firstString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        let secondString = NSAttributedString(string: "*", attributes: [NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR])
        firstString.append(secondString)

        lbl.attributedText = firstString

        return lbl
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    let titleButton: UIButton  {
//        let btn = UIButton(type: .system)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle("Mr", for: .normal)
//        btn.contentHorizontalAlignment = .left
//        btn.setTitleColor(.black, for: .normal)
//        retrn btn
//    }()

}


