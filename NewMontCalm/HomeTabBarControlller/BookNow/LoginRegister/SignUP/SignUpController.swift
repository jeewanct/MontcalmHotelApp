//
//  SignUpController.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

enum ProfileValue{
    case EDITPROFILE
    case REGISTER
}




class SignUpController: UITableViewController {

    var screenType: ProfileValue?{
        didSet{
            if screenType == ProfileValue.EDITPROFILE{

                title = "Edit Profile"
               // contactInfoCell.passwordHeightAnchor?.constant = 0
                contactInfoCell.confirmPassHeightAnchor?.constant = 0
                prefillUserDetails()

            }else{
                title = "Sign Up"
            }
        }

    }
    var countryList: [GetCountry]?
    var userData: RegisterSuccessfulModel?

    var serverData = [
        "title" : "",
        "firstName" : "",
        "lastName" : "",
        "dateOfBirth" : "",
        "gender" : "",
        "addressType" : "",
        "address1" : "",
        "address2" : "",
        "city" : "",
        "state" : "",
        "country" : "",
        "zipCode" : "",
        "phoneType" : "",
        "phoneNumber" : "",
        "faxNumber" : "",
        "email" : "",
        "password" : ""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        
    }

    func setup(){

        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension

        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR

        if #available(iOS 11.0, *){
             navigationController?.navigationBar.prefersLargeTitles = true
        }


        self.performSelector(inBackground: #selector(callCountryApi), with: nil)

       // title = "Sign up"
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleClose))
        closeButton.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        navigationItem.rightBarButtonItem = closeButton
    }

    
    let personalInfoCell = PersonalDetailsCell()
    let addressInfoCell = AddressDetails()
    let contactInfoCell = ContactInformationCell()
    let recommendedByCell = AdditionalInformationCell()



}
