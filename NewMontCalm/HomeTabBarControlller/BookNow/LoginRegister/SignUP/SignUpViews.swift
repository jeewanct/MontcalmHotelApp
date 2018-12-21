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
        lbl.font =  UIFont.boldSystemFont(ofSize: 17)
        lbl.minimumScaleFactor = 0.1
        
        return lbl
    }()


}


extension PersonalHeader{

    func addViews(){

        let detailView = WhiteView()


        let informationLabel = detailView.staticLabelsWithTextColor(title: SignUpStrings.HEADERINFOTEXT, textColor: Constants.Appearance.SECONDARYCOLOR)


        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


        detailView.addSubview(titleLabel)
        titleLabel.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.43).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.25).isActive = true


        detailView.addSubview(informationLabel)
        informationLabel.anchorWithConstantsToTop(top: titleLabel.bottomAnchor, left: detailView.leftAnchor, bottom: detailView.bottomAnchor, right: detailView.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


    }



}


extension SignUpController{
    func addViews(){

       

    }
}

extension PersonalDetailsCell{

    func addViews(){

        let detailView = WhiteView()
        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)




        let titleLabel = detailView.staticLabels(title: SignUpStrings.TITLE, title2: "*")
        let firstNameLabel = detailView.staticLabels(title: SignUpStrings.FIRSTNAME, title2: "*")
        let lastNameLabel = detailView.staticLabels(title: SignUpStrings.LASTNAME, title2: "*")
        let dobLabel = detailView.staticLabels(title: SignUpStrings.DATEOFBIRTH, title2: "")
        let genderLabel = detailView.staticLabels(title: SignUpStrings.GENDER, title2: "")


        detailView.addSubview(personTitleButton)
        detailView.addSubview(firstNameText)
        detailView.addSubview(lastNameText)
        detailView.addSubview(dateOfBirthButton)
        detailView.addSubview(genderButton)



        personTitleButton.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        personTitleButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        personTitleButton.addSubview(titleLabel)
        titleLabel.anchorToTop(top: personTitleButton.topAnchor, left: personTitleButton.leftAnchor, bottom: personTitleButton.bottomAnchor, right: nil)
        titleLabel.widthAnchor.constraint(equalTo: personTitleButton.widthAnchor, multiplier: 0.43).isActive = true

        firstNameText.anchorWithConstantsToTop(top: personTitleButton.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        firstNameText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        firstNameText.addSubview(firstNameLabel)
        firstNameLabel.anchorToTop(top: firstNameText.topAnchor, left: firstNameText.leftAnchor, bottom: firstNameText.bottomAnchor, right: nil)
        firstNameLabel.widthAnchor.constraint(equalTo: firstNameText.widthAnchor, multiplier: 0.43).isActive = true

        lastNameText.anchorWithConstantsToTop(top: firstNameText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        lastNameText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        lastNameText.addSubview(lastNameLabel)
        lastNameLabel.anchorToTop(top: lastNameText.topAnchor, left: lastNameText.leftAnchor, bottom: lastNameText.bottomAnchor, right: nil)
        lastNameLabel.widthAnchor.constraint(equalTo: lastNameText.widthAnchor, multiplier: 0.43).isActive = true



        dateOfBirthButton.anchorWithConstantsToTop(top: lastNameText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateOfBirthButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true



        dateOfBirthButton.addSubview(dobLabel)
        dobLabel.anchorToTop(top: dateOfBirthButton.topAnchor, left: dateOfBirthButton.leftAnchor, bottom: dateOfBirthButton.bottomAnchor, right: nil)
        dobLabel.widthAnchor.constraint(equalTo: dateOfBirthButton.widthAnchor, multiplier: 0.43).isActive = true

        genderButton.anchorWithConstantsToTop(top: dateOfBirthButton.bottomAnchor, left: detailView.leftAnchor, bottom: bottomAnchor, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        genderButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        genderButton.addSubview(genderLabel)
        genderLabel.anchorToTop(top: genderButton.topAnchor, left: genderButton.leftAnchor, bottom: genderButton.bottomAnchor, right: nil)
        genderLabel.widthAnchor.constraint(equalTo: genderButton.widthAnchor, multiplier: 0.43).isActive = true

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

        let address1Label = detailView.staticLabels(title: SignUpStrings.ADDRESS1, title2: "*")
        let address2Label = detailView.staticLabels(title: SignUpStrings.ADDRESS2, title2: "")
        let cityLabel = detailView.staticLabels(title: SignUpStrings.CITYNAME, title2: "*")
        let stateLabel = detailView.staticLabels(title: SignUpStrings.SELECTSTATE, title2: "")
        let selectCountryLabel = detailView.staticLabels(title: SignUpStrings.SELECTCOUNTRY, title2: "*")
        let zipLabel = detailView.staticLabels(title: SignUpStrings.ZIPCODE, title2: "*")


        address1Text.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        address1Text.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        address1Text.addSubview(address1Label)
        address1Label.anchorToTop(top: address1Text.topAnchor, left: address1Text.leftAnchor, bottom: address1Text.bottomAnchor, right: nil)
        address1Label.widthAnchor.constraint(equalTo: address1Text.widthAnchor, multiplier: 0.43).isActive = true

        address2Text.anchorWithConstantsToTop(top: address1Text.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        address2Text.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        address2Text.addSubview(address2Label)
        address2Label.anchorToTop(top: address2Text.topAnchor, left: address2Text.leftAnchor, bottom: address2Text.bottomAnchor, right: nil)
        address2Label.widthAnchor.constraint(equalTo: address2Text.widthAnchor, multiplier: 0.43).isActive = true

        cityText.anchorWithConstantsToTop(top: address2Text.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        cityText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        cityText.addSubview(cityLabel)
        cityLabel.anchorToTop(top: cityText.topAnchor, left: cityText.leftAnchor, bottom: cityText.bottomAnchor, right: nil)
        cityLabel.widthAnchor.constraint(equalTo: cityText.widthAnchor, multiplier: 0.43).isActive = true



        stateText.anchorWithConstantsToTop(top: cityText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        stateText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true



        stateText.addSubview(stateLabel)
        stateLabel.anchorToTop(top: stateText.topAnchor, left: stateText.leftAnchor, bottom: stateText.bottomAnchor, right: nil)
        stateLabel.widthAnchor.constraint(equalTo: stateText.widthAnchor, multiplier: 0.43).isActive = true

        countryButton.anchorWithConstantsToTop(top: stateText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        countryButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        countryButton.addSubview(selectCountryLabel)
        selectCountryLabel.anchorToTop(top: countryButton.topAnchor, left: countryButton.leftAnchor, bottom: countryButton.bottomAnchor, right: nil)
        selectCountryLabel.widthAnchor.constraint(equalTo: countryButton.widthAnchor, multiplier: 0.43).isActive = true


        zipText.anchorWithConstantsToTop(top: countryButton.bottomAnchor, left: detailView.leftAnchor, bottom: bottomAnchor, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        zipText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        zipText.addSubview(zipLabel)
        zipLabel.anchorToTop(top: zipText.topAnchor, left: zipText.leftAnchor, bottom: zipText.bottomAnchor, right: nil)
        zipLabel.widthAnchor.constraint(equalTo: zipText.widthAnchor, multiplier: 0.43).isActive = true

    }



}

extension ContactInformationCell{


    func addViews(){


        let detailView = WhiteView()

        
        let phoneLabel = detailView.staticLabels(title: SignUpStrings.PHONENUMBER, title2: "*")
       // let faxLabel = detailView.staticLabels(title: SignUpStrings.FAXNUMBER, title2: "")
        let emailLabel = detailView.staticLabels(title: SignUpStrings.EMAILADDRESS, title2: "*")
       // let confirmEmailLabel = detailView.staticLabels(title: SignUpStrings.CONFIRMEMAIL, title2: "*")
        let passwordLabel = detailView.staticLabels(title: SignUpStrings.PASSWORD, title2: "*")
        let confirmPasswordLabel = detailView.staticLabels(title: SignUpStrings.RETYPEPASSWORD, title2: "*")


        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)


        detailView.addSubview(phoneNumberText)
       // detailView.addSubview(faxNumberText)
        detailView.addSubview(emailAddressText)
       // detailView.addSubview(confirmEmailText)
        detailView.addSubview(passwordText)
        detailView.addSubview(confirmPasswordText)



        phoneNumberText.anchorWithConstantsToTop(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        phoneNumberText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        phoneNumberText.addSubview(phoneLabel)
        phoneLabel.anchorToTop(top: phoneNumberText.topAnchor, left: phoneNumberText.leftAnchor, bottom: phoneNumberText.bottomAnchor, right: nil)
        phoneLabel.widthAnchor.constraint(equalTo: phoneNumberText.widthAnchor, multiplier: 0.43).isActive = true

//        faxNumberText.anchorWithConstantsToTop(top: phoneNumberText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
//        faxNumberText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


//        faxNumberText.addSubview(faxLabel)
//        faxLabel.anchorToTop(top: faxNumberText.topAnchor, left: faxNumberText.leftAnchor, bottom: faxNumberText.bottomAnchor, right: nil)
//        faxLabel.widthAnchor.constraint(equalTo: faxNumberText.widthAnchor, multiplier: 0.43).isActive = true

        emailAddressText.anchorWithConstantsToTop(top: phoneNumberText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        emailAddressText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true


        emailAddressText.addSubview(emailLabel)
        emailLabel.anchorToTop(top: emailAddressText.topAnchor, left: emailAddressText.leftAnchor, bottom: emailAddressText.bottomAnchor, right: nil)
        emailLabel.widthAnchor.constraint(equalTo: emailAddressText.widthAnchor, multiplier: 0.43).isActive = true



//        confirmEmailText.anchorWithConstantsToTop(top: emailAddressText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
//        confirmEmailText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
//
//
//
//        confirmEmailText.addSubview(confirmEmailLabel)
//         confirmEmailLabel.anchorToTop(top: confirmEmailText.topAnchor, left: confirmEmailText.leftAnchor, bottom: confirmEmailText.bottomAnchor, right: nil)
//        confirmEmailLabel.widthAnchor.constraint(equalTo: confirmEmailText.widthAnchor, multiplier: 0.43).isActive = true

        passwordText.anchorWithConstantsToTop(top: emailAddressText.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        passwordHeightAnchor =  passwordText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07)
        passwordHeightAnchor?.isActive = true

        passwordText.addSubview(passwordLabel)
        passwordLabel.anchorToTop(top: passwordText.topAnchor, left: passwordText.leftAnchor, bottom: passwordText.bottomAnchor, right: nil)
        passwordLabel.widthAnchor.constraint(equalTo: passwordText.widthAnchor, multiplier: 0.43).isActive = true


        confirmPasswordText.anchorWithConstantsToTop(top: passwordText.bottomAnchor, left: detailView.leftAnchor, bottom: bottomAnchor, right: detailView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        confirmPassHeightAnchor = confirmPasswordText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07)
        confirmPassHeightAnchor?.isActive = true

        confirmPasswordText.addSubview(confirmPasswordLabel)
        confirmPasswordLabel.anchorToTop(top: confirmPasswordText.topAnchor, left: confirmPasswordText.leftAnchor, bottom: confirmPasswordText.bottomAnchor, right: nil)
        confirmPasswordLabel.widthAnchor.constraint(equalTo: confirmPasswordText.widthAnchor, multiplier: 0.43).isActive = true


    }




}

extension  AdditionalInformationCell{

    func addViews(){

        let informationText = UILabel()
        informationText.translatesAutoresizingMaskIntoConstraints = false
        informationText.text = SignUpStrings.AGREEMENTTEXT
        informationText.numberOfLines = 0
        informationText.adjustsFontSizeToFitWidth = true
        informationText.minimumScaleFactor = 0.5

        let detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .white

        addSubview(detailView)
        detailView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)



        addSubview(informationText)
        informationText.anchorWithConstantsToTop(top: topAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
     //   informationText.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.37 ).isActive = true

        addSubview(acceptButton)
        acceptButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        acceptButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        acceptButton.topAnchor.constraint(equalTo: informationText.bottomAnchor, constant: 8).isActive = true
        acceptButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 16).isActive = true


        let acceptLabel = tempLabels(firstString: SignUpStrings.IACCEPT1, secondString: SignUpStrings.IACCEPT2)
        detailView.addSubview(acceptLabel)
        acceptLabel.centerYAnchor.constraint(equalTo: acceptButton.centerYAnchor).isActive = true
        acceptLabel.leftAnchor.constraint(equalTo: acceptButton.rightAnchor, constant: 8).isActive = true
        acceptLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -16).isActive = true

        addSubview(ageButton)
        ageButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        ageButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        ageButton.topAnchor.constraint(equalTo: acceptButton.bottomAnchor, constant: 8).isActive = true
        ageButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 16).isActive = true

        let ageLabel = tempLabels(firstString: SignUpStrings.TICKTHEBOX, secondString: "")
        addSubview(ageLabel)
        ageLabel.centerYAnchor.constraint(equalTo: ageButton.centerYAnchor).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: ageButton.rightAnchor, constant: 8).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -16).isActive = true


        addSubview(submitButton)
        submitButton.anchorWithConstantsToTop(top: ageButton.bottomAnchor, left: detailView.leftAnchor, bottom: bottomAnchor, right: detailView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        submitButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true


    }

    func tempLabels(firstString: String, secondString: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.numberOfLines = 1

        lbl.attributedText = lbl.convertAttributeString(firstString: firstString, secondString: secondString, firstColor: .black, secondColor: Constants.Appearance.PRIMARYCOLOR)


        return lbl
    }
}



