//
//  SignUpViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit



class PersonalHeader: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        lbl.text = "Payment Details"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont(name: "LATO-REGULAR", size: 20)
        lbl.minimumScaleFactor = 0.1
        return lbl
    }()
}


extension PersonalHeader{

    func addViews(){

        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white



        let informationLabel = UILabel()
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.textColor = Constants.Appearance.PRIMARYCOLOR
        informationLabel.textColor = .black
        informationLabel.minimumScaleFactor = 0.1
        informationLabel.adjustsFontSizeToFitWidth = true
        informationLabel.text = "Please enter your information. * Indicates required field."
        informationLabel.numberOfLines = 0
        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


        detailView.addSubview(titleLabel)
        titleLabel.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.25).isActive = true


        detailView.addSubview(informationLabel)
        informationLabel.anchorWithConstantsToTop(top: titleLabel.bottomAnchor, left: detailView.leftAnchor, bottom: detailView.bottomAnchor, right: detailView.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)




    }



}


extension SignUpController{
    func addViews(){
//        view.addSubview(userInformationTableView)
//        userInformationTableView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 28, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
       

    }
}

extension PersonalDetailsCell{

    func addViews(){


        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        detailView.addSubview(personTitleButton)
        detailView.addSubview(firstNameText)
        detailView.addSubview(lastNameText)
        detailView.addSubview(dateOfBirthButton)
        detailView.addSubview(genderButton)



        personTitleButton.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        personTitleButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let titleLabel = tempLabels(title: "Title")
        personTitleButton.addSubview(titleLabel)
        titleLabel.anchorToTop(top: personTitleButton.topAnchor, left: personTitleButton.leftAnchor, bottom: personTitleButton.bottomAnchor, right: nil)
        titleLabel.widthAnchor.constraint(equalTo: personTitleButton.widthAnchor, multiplier: 0.4).isActive = true

        firstNameText.anchorWithConstantsToTop(top: personTitleButton.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        firstNameText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let firstNameLabel = tempLabels(title: "First Name")
        firstNameText.addSubview(firstNameLabel)
        firstNameLabel.anchorToTop(top: firstNameText.topAnchor, left: firstNameText.leftAnchor, bottom: firstNameText.bottomAnchor, right: nil)
        firstNameLabel.widthAnchor.constraint(equalTo: firstNameText.widthAnchor, multiplier: 0.4).isActive = true

        lastNameText.anchorWithConstantsToTop(top: firstNameText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        lastNameText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let lastNameLabel = tempLabels(title: "Last Name")
        lastNameText.addSubview(lastNameLabel)
        lastNameLabel.anchorToTop(top: lastNameText.topAnchor, left: lastNameText.leftAnchor, bottom: lastNameText.bottomAnchor, right: nil)
        lastNameLabel.widthAnchor.constraint(equalTo: lastNameText.widthAnchor, multiplier: 0.4).isActive = true



        dateOfBirthButton.anchorWithConstantsToTop(top: lastNameText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateOfBirthButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        let dobLabel = tempLabels(title: "Date Of Birth")
        dateOfBirthButton.addSubview(dobLabel)
        dobLabel.anchorToTop(top: dateOfBirthButton.topAnchor, left: dateOfBirthButton.leftAnchor, bottom: dateOfBirthButton.bottomAnchor, right: nil)
        dobLabel.widthAnchor.constraint(equalTo: dateOfBirthButton.widthAnchor, multiplier: 0.4).isActive = true

        genderButton.anchorWithConstantsToTop(top: dateOfBirthButton.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        genderButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let genderLabel = tempLabels(title: "Gender")
        genderButton.addSubview(genderLabel)
        genderLabel.anchorToTop(top: genderButton.topAnchor, left: genderButton.leftAnchor, bottom: genderButton.bottomAnchor, right: nil)
        genderLabel.widthAnchor.constraint(equalTo: genderButton.widthAnchor, multiplier: 0.4).isActive = true

    }

    func tempLabels(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let firstString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        let secondString = NSAttributedString(string: "*", attributes: [NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR])
        firstString.append(secondString)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1

        lbl.attributedText = firstString

        return lbl
    }
}

extension AddressDetails{


    func addViews(){


        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        detailView.addSubview(address1Text)
        detailView.addSubview(address2Text)
        detailView.addSubview(cityText)
        detailView.addSubview(stateText)
        detailView.addSubview(countryButton)
        detailView.addSubview(zipText)



        address1Text.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        address1Text.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let address1Label = tempLabels(title: "Address1")
        address1Text.addSubview(address1Label)
        address1Label.anchorToTop(top: address1Text.topAnchor, left: address1Text.leftAnchor, bottom: address1Text.bottomAnchor, right: nil)
        address1Label.widthAnchor.constraint(equalTo: address1Text.widthAnchor, multiplier: 0.4).isActive = true

        address2Text.anchorWithConstantsToTop(top: address1Text.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        address2Text.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let address2Label = tempLabels(title: "Address2")
        address2Text.addSubview(address2Label)
        address2Label.anchorToTop(top: address2Text.topAnchor, left: address2Text.leftAnchor, bottom: address2Text.bottomAnchor, right: nil)
        address2Label.widthAnchor.constraint(equalTo: address2Text.widthAnchor, multiplier: 0.4).isActive = true

        cityText.anchorWithConstantsToTop(top: address2Text.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        cityText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let cityLabel = tempLabels(title: "City Name")
        cityText.addSubview(cityLabel)
        cityLabel.anchorToTop(top: cityText.topAnchor, left: cityText.leftAnchor, bottom: cityText.bottomAnchor, right: nil)
        cityLabel.widthAnchor.constraint(equalTo: cityText.widthAnchor, multiplier: 0.4).isActive = true



        stateText.anchorWithConstantsToTop(top: cityText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        stateText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        let stateLabel = tempLabels(title: "Select State")
        stateText.addSubview(stateLabel)
        stateLabel.anchorToTop(top: stateText.topAnchor, left: stateText.leftAnchor, bottom: stateText.bottomAnchor, right: nil)
        stateLabel.widthAnchor.constraint(equalTo: stateText.widthAnchor, multiplier: 0.4).isActive = true

        countryButton.anchorWithConstantsToTop(top: stateText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        countryButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let selectCountryLabel = tempLabels(title: "Select Country")
        countryButton.addSubview(selectCountryLabel)
        selectCountryLabel.anchorToTop(top: countryButton.topAnchor, left: countryButton.leftAnchor, bottom: countryButton.bottomAnchor, right: nil)
        selectCountryLabel.widthAnchor.constraint(equalTo: countryButton.widthAnchor, multiplier: 0.4).isActive = true


        zipText.anchorWithConstantsToTop(top: countryButton.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        zipText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let zipLabel = tempLabels(title: "Zip Code")
        zipText.addSubview(zipLabel)
        zipLabel.anchorToTop(top: zipText.topAnchor, left: zipText.leftAnchor, bottom: zipText.bottomAnchor, right: nil)
        zipLabel.widthAnchor.constraint(equalTo: zipText.widthAnchor, multiplier: 0.4).isActive = true

    }

    func tempLabels(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let firstString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        let secondString = NSAttributedString(string: "*", attributes: [NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR])
        firstString.append(secondString)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1

        lbl.attributedText = firstString

        return lbl
    }


}

extension ContactInformationCell{


    func addViews(){


        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        detailView.addSubview(phoneNumberText)
        detailView.addSubview(faxNumberText)
        detailView.addSubview(emailAddressText)
        detailView.addSubview(confirmEmailText)
        detailView.addSubview(passwordText)
        detailView.addSubview(confirmPasswordText)



        phoneNumberText.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        phoneNumberText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let phoneLabel = tempLabels(title: "Phone Number")
        phoneNumberText.addSubview(phoneLabel)
        phoneLabel.anchorToTop(top: phoneNumberText.topAnchor, left: phoneNumberText.leftAnchor, bottom: phoneNumberText.bottomAnchor, right: nil)
        phoneLabel.widthAnchor.constraint(equalTo: phoneNumberText.widthAnchor, multiplier: 0.4).isActive = true

        faxNumberText.anchorWithConstantsToTop(top: phoneNumberText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        faxNumberText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let faxLabel = tempLabels(title: "Fax Number")
        faxNumberText.addSubview(faxLabel)
        faxLabel.anchorToTop(top: faxNumberText.topAnchor, left: faxNumberText.leftAnchor, bottom: faxNumberText.bottomAnchor, right: nil)
        faxLabel.widthAnchor.constraint(equalTo: faxNumberText.widthAnchor, multiplier: 0.4).isActive = true

        emailAddressText.anchorWithConstantsToTop(top: faxNumberText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        emailAddressText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let emailLabel = tempLabels(title: "Email Address")
        emailAddressText.addSubview(emailLabel)
        emailLabel.anchorToTop(top: emailAddressText.topAnchor, left: emailAddressText.leftAnchor, bottom: emailAddressText.bottomAnchor, right: nil)
        emailLabel.widthAnchor.constraint(equalTo: emailAddressText.widthAnchor, multiplier: 0.4).isActive = true



        confirmEmailText.anchorWithConstantsToTop(top: emailAddressText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        confirmEmailText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        let confirmEmailLabel = tempLabels(title: "Confirm Email")
        confirmEmailText.addSubview(confirmEmailLabel)
        confirmEmailLabel.anchorToTop(top: confirmEmailText.topAnchor, left: confirmEmailText.leftAnchor, bottom: confirmEmailText.bottomAnchor, right: nil)
        confirmEmailLabel.widthAnchor.constraint(equalTo: confirmEmailText.widthAnchor, multiplier: 0.4).isActive = true

        passwordText.anchorWithConstantsToTop(top: confirmEmailText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        passwordText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let passwordLabel = tempLabels(title: "Password")
        passwordText.addSubview(passwordLabel)
        passwordLabel.anchorToTop(top: passwordText.topAnchor, left: passwordText.leftAnchor, bottom: passwordText.bottomAnchor, right: nil)
        passwordLabel.widthAnchor.constraint(equalTo: passwordText.widthAnchor, multiplier: 0.4).isActive = true


        confirmPasswordText.anchorWithConstantsToTop(top: passwordText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        confirmPasswordText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true

        let confirmPasswordLabel = tempLabels(title: "Re Type Password")
        confirmPasswordText.addSubview(confirmPasswordLabel)
        confirmPasswordLabel.anchorToTop(top: confirmPasswordText.topAnchor, left: confirmPasswordText.leftAnchor, bottom: confirmPasswordText.bottomAnchor, right: nil)
        confirmPasswordLabel.widthAnchor.constraint(equalTo: confirmPasswordText.widthAnchor, multiplier: 0.4).isActive = true

    }

    func tempLabels(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let firstString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        let secondString = NSAttributedString(string: "*", attributes: [NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR])
        firstString.append(secondString)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1

        lbl.attributedText = firstString

        return lbl
    }


}

extension  AdditionalInformationCell{

    func addViews(){

        let informationText = UILabel()
        informationText.translatesAutoresizingMaskIntoConstraints = false
        informationText.text = "Recommended by\n\nPlease review The Montcalm Club Terms and Conditions and tick the box below to complete the registration process."
        informationText.numberOfLines = 0
        informationText.adjustsFontSizeToFitWidth = true
        informationText.minimumScaleFactor = 0.5

        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)



        detailView.addSubview(informationText)
        informationText.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        informationText.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.37 ).isActive = true

        detailView.addSubview(acceptButton)
        acceptButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        acceptButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        acceptButton.topAnchor.constraint(equalTo: informationText.bottomAnchor, constant: 8).isActive = true
        acceptButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 16).isActive = true


        let acceptLabel = tempLabels(firstString: "I accept the Montcalm Club ", secondString: "Terms & Conditions.")
        detailView.addSubview(acceptLabel)
        acceptLabel.centerYAnchor.constraint(equalTo: acceptButton.centerYAnchor).isActive = true
        acceptLabel.leftAnchor.constraint(equalTo: acceptButton.rightAnchor, constant: 8).isActive = true
        acceptLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -16).isActive = true

        detailView.addSubview(ageButton)
        ageButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        ageButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        ageButton.topAnchor.constraint(equalTo: acceptButton.bottomAnchor, constant: 8).isActive = true
        ageButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 16).isActive = true

        let ageLabel = tempLabels(firstString: "Tick this box to confirm you are 8 years old or over.", secondString: "")
        detailView.addSubview(ageLabel)
        ageLabel.centerYAnchor.constraint(equalTo: ageButton.centerYAnchor).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: ageButton.rightAnchor, constant: 8).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -16).isActive = true


        detailView.addSubview(submitButton)
        submitButton.anchorWithConstantsToTop(top: ageButton.bottomAnchor, left: detailView.leftAnchor, bottom: detailView.bottomAnchor, right: detailView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


    }

    func tempLabels(firstString: String, secondString: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let firstString = NSMutableAttributedString(string: firstString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        let secondString = NSAttributedString(string: secondString, attributes: [NSAttributedStringKey.foregroundColor: Constants.Appearance.PRIMARYCOLOR])
        firstString.append(secondString)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.numberOfLines = 1

        lbl.attributedText = firstString

        return lbl
    }
}



