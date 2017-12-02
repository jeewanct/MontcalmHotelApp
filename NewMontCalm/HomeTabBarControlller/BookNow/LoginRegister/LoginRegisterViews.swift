//
//  LoginRegisterViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension LoginRegister{
    
    func addViews(){
        headerView = LoginHeaderView()
        tableView.addSubview(headerView)
    }
}

//MARK:  Login RegisterCell Views

extension LoginRegisterCell{

    func addViews(){

        let headerText = UILabel()
        headerText.translatesAutoresizingMaskIntoConstraints = false
        headerText.textColor = Constants.Appearance.PRIMARYCOLOR
        headerText.text = "Log In To Your Account"
        headerText.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 20)
        headerText.textAlignment = .center
        addSubview(headerText)
        headerText.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16 , bottomConstant: 0, rightConstant: 16)

        headerText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true
        //headerText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true



        addSubview(emailText)
        emailText.anchorWithConstantsToTop(top: headerText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        emailText.heightAnchor.constraint(equalTo: headerText.heightAnchor).isActive = true

        addSubview(passwordText)
        passwordText.anchorWithConstantsToTop(top: emailText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        passwordText.heightAnchor.constraint(equalTo: headerText.heightAnchor).isActive = true

        addSubview(loginButton)
        loginButton.anchorWithConstantsToTop(top: passwordText.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        loginButton.heightAnchor.constraint(equalTo: headerText.heightAnchor).isActive = true


        let orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "OR"
        orLabel.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        orLabel.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        orLabel.textAlignment = .center


        let sepView = UIView()
        sepView.translatesAutoresizingMaskIntoConstraints = false
        sepView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        addSubview(sepView)
        addSubview(orLabel)
        orLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16).isActive = true
        orLabel.heightAnchor.constraint(equalTo: headerText.heightAnchor).isActive = true


        sepView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor).isActive = true
        sepView.leftAnchor.constraint(equalTo: leftAnchor,constant: 16).isActive = true
        sepView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        sepView.heightAnchor.constraint(equalToConstant: 1).isActive = true


        addSubview(signupButton)
        signupButton.anchorWithConstantsToTop(top: orLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        signupButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true


    }
}


//MARK:  Login Header Views
extension LoginHeaderView{

    func addViews(){
        let backgroundImage = UIImageView()
        backgroundImage.image = #imageLiteral(resourceName: "tempHotel")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false


        let blackView = BlackView()

        addSubview(backgroundImage)
        backgroundImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor )

        addSubview(blackView)
        blackView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)


        let hotelName = UILabel()
        hotelName.text = "THE MONTCALM® \n LONDON MARBLE ARCH"
        hotelName.textAlignment = .center
        hotelName.numberOfLines = 0
        hotelName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        hotelName.minimumScaleFactor = 0.1
        hotelName.adjustsFontSizeToFitWidth = true

        let attributeText = NSMutableAttributedString(string: "THE MONTCALM®\n", attributes: [NSAttributedStringKey.font: UIFont.init(name: hotelName.font.fontName, size: 35) as Any])
        let attributeText2 = NSMutableAttributedString(string: "LONDON MARBLE ARCH", attributes: [NSAttributedStringKey.font: UIFont.init(name: hotelName.font.fontName, size: 20) as Any])
        attributeText.append(attributeText2)
        hotelName.attributedText = attributeText

        addSubview(hotelName)
        hotelName.translatesAutoresizingMaskIntoConstraints = false
        hotelName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        hotelName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        hotelName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hotelName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

}
