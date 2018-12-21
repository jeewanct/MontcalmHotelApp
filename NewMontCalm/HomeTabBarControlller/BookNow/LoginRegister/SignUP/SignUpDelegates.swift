//
//  SignUpDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SignUpController{

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = PersonalHeader()
        headerView.titleLabel.text = ["Personal Information", "Address", "Contact Information", "Additional Information"][section]
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
        let estimatedFrame = NSString(string: ["Personal Information", "Address", "Contact Information", "Additional Information"][section]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17) ], context: nil)

        let estimatedFrame1 = NSString(string: SignUpStrings.HEADERINFOTEXT).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:  UIFont.boldSystemFont(ofSize: 15) ], context: nil)




        return estimatedFrame.height + estimatedFrame1.height + 72

    }

    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            return personalInfoCell
        case 1:
            return addressInfoCell
        case 2:
            return contactInfoCell
        default:
            recommendedByCell.parentInstance = self
            return recommendedByCell
        }



    }

}


extension SignUpController{

    @objc func registerUserToServer(){

        let obj = ViewControllersHTTPRequest()
        obj.registerUser(userInfo: serverData, completion: { (data) in
            self.userData = data
            self.performSelector(onMainThread: #selector(self.succesfullyRegister), with: nil, waitUntilDone: false)
        }) { (error) in

        }
    }


    @objc func editRegisterUserToServer(){

        let obj = ViewControllersHTTPRequest()
        obj.editRegisteredUserDetails(userInfo: serverData, completion: { (data) in
            self.userData = data
            self.performSelector(onMainThread: #selector(self.succesfullyRegister), with: nil, waitUntilDone: false)
        }) { (error) in

        }
    }


    @objc func succesfullyRegister(){

        if let userRegistered = self.userData?.userDetails?.userId{

            if userRegistered.count > 0{

                CustomAlerts.shared.showAlert(alertTitle: "Great", alertMessage: "FSDfdsfsfd", actionTitle: "dsfsdfs", controller: self)
                SaveUserDataOnRegister.shared.saveDataToPList(userModel: userData?.userDetails)

                SaveUserDataOnRegister.shared.getUserDataFromPlist(completion: { (userData) in
                    print(userData.country)
                }, error: { (error) in
                    print(error)
                })

            }
        }

    }




    func checkRequiredFields(){

        var alertMessage = String()
        alertMessage.append(checkEmpty(textField: personalInfoCell.firstNameText, key: "firstName"))
        alertMessage.append(checkEmpty(textField: personalInfoCell.lastNameText, key: "lastName"))

        alertMessage.append(checkEmpty(textField: addressInfoCell.address1Text, key: "address1"))
        alertMessage.append(checkEmpty(textField: addressInfoCell.cityText, key: "city"))
        alertMessage.append(checkEmpty(textField: addressInfoCell.zipText, key: "zipCode"))

        alertMessage.append(checkEmpty(textField: contactInfoCell.phoneNumberText, key: "phoneNumber"))
        alertMessage.append(checkEmpty(textField: contactInfoCell.emailAddressText, key: "email"))
        alertMessage.append(checkEmpty(textField: contactInfoCell.passwordText, key: "password"))



        if addressInfoCell.countryButton.title(for: .normal) == SignUpStrings.SELECTCOUNTRY{
            alertMessage.append("\(SignUpStrings.SELECTCOUNTRY), ")
        }else{
            if let countryCode = addressInfoCell.countryDetails?.countryCode,let userTitle = personalInfoCell.personTitleButton.title(for: .normal){
                serverData.updateValue(countryCode, forKey: "country")
                serverData.updateValue(userTitle, forKey: "title")
            }

        }

        if let address2 = addressInfoCell.address2Text.text, let state = addressInfoCell.stateText.text, let gender = personalInfoCell.genderButton.title(for: .normal)  {
            serverData.updateValue(address2, forKey: "address2")
            serverData.updateValue(state, forKey: "state")
           // serverData.updateValue(faxNumber, forKey: "faxNumber")
            serverData.updateValue(gender, forKey: "gender")
        }


         print("The server data is ", serverData)

        if alertMessage == ""{

            if let type = screenType{
                switch type{
                case .EDITPROFILE:
                    self.performSelector(inBackground: #selector(editRegisterUserToServer), with: nil)
                case .REGISTER:
                    self.performSelector(inBackground: #selector(registerUserToServer), with: nil)

                }
            }

        }else{
            CustomAlerts.shared.showAlert(alertTitle: SignUpStrings.ALERTTITLE, alertMessage: "\(alertMessage) \(SignUpStrings.ALERTMESSAGE)", actionTitle: SignUpStrings.ACTIONTITLE, controller: self)
        }

    }



    func checkEmpty(textField: UITextField, key: String) -> String{

        if let getValue = textField.text{
            if getValue.count > 0 {
                serverData.updateValue(getValue, forKey: key)
                return ""
            }else{
                if let message = textField.placeholder{
                    return "\(message), "
                }
            }
        }
        return ""

    }


    @objc func handleClose(){
        self.dismiss(animated: true, completion: nil)
    }

    @objc func callCountryApi(){

        let obj = ViewControllersHTTPRequest()
        obj.getCountryList(completion: { (data) in
            self.countryList = data
            self.addressInfoCell.countryList = self.countryList
        }) { (error) in
        }


    }

    func handleAlerts(alertTitle: String, alertMessage: String, actionTitle: String){

        CustomAlerts.shared.showAlert(alertTitle: alertTitle, alertMessage: alertMessage, actionTitle: actionTitle, controller: self)

    }




}







extension UITextField{

    func addBorder(textField: UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true

    }



}

extension UIButton{

    func addBorder(textField: UIButton){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true

    }
}


extension  AdditionalInformationCell{

    @objc func handleAge(){
        if ageButton.tag == 0 {
            ageButton.layer.borderWidth = UIScreen.main.bounds.width * 0.03
            ageButton.tag = 1
        }else{
            ageButton.layer.borderWidth = 2
            ageButton.tag = 0
        }
    }

    @objc func handleAccept(){
        if acceptButton.tag == 0 {
            acceptButton.layer.borderWidth = UIScreen.main.bounds.width * 0.03
            acceptButton.tag = 1
        }else{
            acceptButton.layer.borderWidth = 2
            acceptButton.tag = 0
        }

    }


    @objc func handleSubmit(){


        if ageButton.tag == 0 || acceptButton.tag == 0{
            parentInstance?.handleAlerts(alertTitle: SignUpStrings.ALERTTITLE, alertMessage: SignUpStrings.AGREEMENTSTRING, actionTitle: SignUpStrings.ACTIONTITLE)
        }else{
             parentInstance?.checkRequiredFields()
        }


    }
}




extension AddressDetails: UITableViewDataSource, UITableViewDelegate{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return countrySearchResult?.count ?? 0

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryDetails = countrySearchResult?[indexPath.item]
        countryView.handleClose()
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell

        cell.currencyName = countrySearchResult?[indexPath.item].countryName


        return cell
    }


}

extension AddressDetails: UISearchBarDelegate, UISearchDisplayDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {


        countrySearchResult = searchText.isEmpty ? countryList : countryList?.filter({ (country) -> Bool in
            return country.countryName?.range(of: searchText, options: .caseInsensitive) != nil
        })

        countryView.contentTable.reloadData()

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }


    
}

extension SignUpController{

    func prefillUserDetails(){

        SaveUserDataOnRegister.shared.getUserDataFromPlist(completion: { (userData) in

            // Personal Information
            self.personalInfoCell.firstNameText.text = userData.firstName
            self.personalInfoCell.lastNameText.text = userData.lastName


            // Address
            self.addressInfoCell.address1Text.text = userData.address1
            self.addressInfoCell.address2Text.text = userData.address2
            self.addressInfoCell.cityText.text = userData.city
            self.addressInfoCell.stateText.text = userData.state
            self.addressInfoCell.countryButton.setTitle(userData.country, for: .normal)
            self.addressInfoCell.zipText.text = userData.zipCode

            // Contact Information
            self.contactInfoCell.phoneNumberText.text = userData.phoneNumber
            self.contactInfoCell.emailAddressText.text = userData.email

        }, error: { (error) in
            print(error)
        })



    }



}
