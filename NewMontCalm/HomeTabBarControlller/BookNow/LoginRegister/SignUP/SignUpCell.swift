//
//  SignUpCell.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class PersonalDetailsCell: UITableViewCell, UITextFieldDelegate{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        selectionStyle = .none
        addViews()
    }

    override func draw(_ rect: CGRect) {

        firstNameText.addBorder(textField: firstNameText)
        lastNameText.addBorder(textField: lastNameText)
        personTitleButton.addBorder(textField: personTitleButton)
        dateOfBirthButton.addBorder(textField: dateOfBirthButton)

    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{

        if textField == firstNameText{
            lastNameText.becomeFirstResponder()
        }else{
            lastNameText.resignFirstResponder()
        }
        return true
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

    lazy var firstNameText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "First Name"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        return tf
    }()

    lazy var lastNameText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
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

class AddressDetails: UITableViewCell, UITextFieldDelegate {

    let countryView = CurrencyView()
    var countrySearchResult: [GetCountry]?
    var countryList: [GetCountry]?{
        didSet{
            countrySearchResult = countryList
        }
    }

    var countryDetails: GetCountry?{
        didSet{
            countryButton.setTitle(countryDetails?.countryName, for: .normal)
        }
    }


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        selectionStyle = .none
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{

        switch textField{
        case address1Text:
            address2Text.becomeFirstResponder()
        case address2Text:
            cityText.becomeFirstResponder()
        case cityText:
            stateText.becomeFirstResponder()
        case stateText:
            stateText.resignFirstResponder()
        default:
            zipText.resignFirstResponder()
        }
        return true
    }

    @objc func handleOpenCountry(){

        if let window = UIApplication.shared.keyWindow{

            countryView.contentTable.delegate = self
            countryView.contentTable.dataSource = self
            countryView.searchBar.delegate = self
            window.addSubview(countryView)
            countryView.anchorToTop(top: window.topAnchor, left: window.leftAnchor, bottom: window.bottomAnchor, right: window.rightAnchor)
        }

    }


    lazy var address1Text: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "Address 1"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        return tf
    }()

    lazy var address2Text: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Address 2"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        return tf
    }()

    lazy var cityText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "City Name"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        return tf
    }()

    lazy var stateText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.placeholder = "State Name"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()


    lazy var countryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.setTitle("Select Country", for: .normal)
        btn.addTarget(self, action: #selector(handleOpenCountry), for: .touchUpInside)
        return btn
    }()

    lazy var zipText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.placeholder = "Zip Code"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()




}


class ContactInformationCell: UITableViewCell, UITextFieldDelegate {

    var passwordHeightAnchor: NSLayoutConstraint?
    var confirmPassHeightAnchor: NSLayoutConstraint?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        selectionStyle = .none
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
    }

    override func draw(_ rect: CGRect) {
        phoneNumberText.addBorder(textField: phoneNumberText)
      //  faxNumberText.addBorder(textField: faxNumberText)
        emailAddressText.addBorder(textField: emailAddressText)
       // confirmEmailText.addBorder(textField: confirmEmailText)
        passwordText.addBorder(textField: passwordText)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{

        switch textField{
        case phoneNumberText:
             emailAddressText.becomeFirstResponder()
        case emailAddressText:
            passwordText.becomeFirstResponder()
        case passwordText:
            confirmPasswordText.becomeFirstResponder()
        default:
            confirmPasswordText.resignFirstResponder()
        }
        return true
    }


    lazy var phoneNumberText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.backgroundColor = .white
        tf.placeholder = "Phone Number"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        tf.keyboardType = .phonePad
        return tf
    }()

//    lazy var faxNumberText: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.contentHorizontalAlignment = .right
//        tf.backgroundColor = .white
//        tf.textAlignment = .right
//        tf.placeholder = "Fax Number"
//        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
//        tf.leftView = leftView
//        tf.leftViewMode = .always
//        tf.delegate = self
//        return tf
//    }()

    lazy var emailAddressText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Email Text"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.keyboardType = .emailAddress
        tf.delegate = self
        return tf
    }()

//    lazy var confirmEmailText: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.contentHorizontalAlignment = .right
//        tf.backgroundColor = .white
//        tf.textAlignment = .right
//        tf.placeholder = "Confirm Email"
//        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
//        tf.leftView = leftView
//        tf.keyboardType = .emailAddress
//        tf.leftViewMode = .always
//        tf.delegate = self
//        return tf
//    }()

    lazy var passwordText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.delegate = self
        return tf
    }()




    lazy var confirmPasswordText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.placeholder = "Confirm Password"
        tf.delegate = self
        tf.isSecureTextEntry = true
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 32) * 0.43, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()




}


class AdditionalInformationCell: UITableViewCell {

    var parentInstance: SignUpController?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    lazy var submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("SUBMIT", for: .normal)
        btn.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return btn
    }()

    lazy var acceptButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderColor = Constants.Appearance.PRIMARYCOLOR.cgColor
        btn.layer.borderWidth = 2
        btn.tag = 0
        btn.addTarget(self, action: #selector(handleAccept), for: .touchUpInside)
        return btn
    }()


    lazy var ageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderColor = Constants.Appearance.PRIMARYCOLOR.cgColor
        btn.layer.borderWidth = 2
        btn.tag = 0
        btn.addTarget(self, action: #selector(handleAge), for: .touchUpInside)
        return btn
    }()
}
