//
//  SignUpCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class PersonalDetailsCell: UITableViewCell{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    override func draw(_ rect: CGRect) {

        firstNameText.addBorder(textField: firstNameText)
        lastNameText.addBorder(textField: lastNameText)
        personTitleButton.addBorder(textField: personTitleButton)
        dateOfBirthButton.addBorder(textField: dateOfBirthButton)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let personTitleButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.setTitle("Mr", for: .normal)
        return btn
    }()

    let firstNameText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "First Name"
        return tf
    }()

    let lastNameText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Last Name"
        return tf
    }()

    let dateOfBirthButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(.black, for: .normal)
         btn.backgroundColor = .white
        btn.setTitle("12/06/2016", for: .normal)
        return btn
    }()
    let genderButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(.black, for: .normal)
         btn.backgroundColor = .white
        btn.setTitle("Male", for: .normal)
        return btn
    }()


}

class AddressDetails: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    override func draw(_ rect: CGRect) {


        address1Text.addBorder(textField: address1Text)
        address2Text.addBorder(textField: address2Text)
        cityText.addBorder(textField: cityText)
        stateText.addBorder(textField: stateText)
        countryButton.addBorder(textField: countryButton)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let address1Text: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "Address 1"
        return tf
    }()

    let address2Text: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Address 2"
        return tf
    }()

    let cityText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "City Name"
        return tf
    }()

    let stateText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "State Name"
        return tf
    }()


    let countryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.setTitle("Select Country", for: .normal)
        return btn
    }()

    let zipText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Zip Code"
        return tf
    }()




}


class ContactInformationCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    override func draw(_ rect: CGRect) {
        phoneNumberText.addBorder(textField: phoneNumberText)
        faxNumberText.addBorder(textField: faxNumberText)
        emailAddressText.addBorder(textField: emailAddressText)
        confirmEmailText.addBorder(textField: confirmEmailText)
        passwordText.addBorder(textField: passwordText)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let phoneNumberText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "Phone Number"
        return tf
    }()

    let faxNumberText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Fax Number"
        return tf
    }()

    let emailAddressText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Email Text"
        return tf
    }()

    let confirmEmailText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Confirm Email"
        return tf
    }()

    let passwordText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()




    let confirmPasswordText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Confirm Password"
        tf.isSecureTextEntry = true
        return tf
    }()




}


class AdditionalInformationCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("SUBMIT", for: .normal)
        return btn
    }()

    let acceptButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderColor = Constants.Appearance.PRIMARYCOLOR.cgColor
        btn.layer.borderWidth = (UIScreen.main.bounds.width - 32) * 0.01
        return btn
    }()


    let ageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderColor = Constants.Appearance.PRIMARYCOLOR.cgColor
        btn.layer.borderWidth = (UIScreen.main.bounds.width - 32) * 0.01
        btn.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return btn
    }()
}
