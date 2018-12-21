//
//  RegisterModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 13/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class RegisterSuccessfulModel:      Codable{

    var message:                    String?
    var userDetails:                RegisterUserInformationModel?

}

class RegisterUserInformationModel: Codable{

    var  userId:                    String?
    var  address1:                  String?
    var  address2:                  String?
    var  city:                      String?
    var  country:                   String?
    var  dateOfBirth:               String?
    var  email:                     String?
    var  faxNumber:                 String?
    var  firstName:                 String?
    var  gender:                    String?
    var  lastName:                  String?
    var  password:                  String?
    var  phoneNumber:               String?
    var  phoneType:                 String?
    var  state:                     String?
    var  title:                     String?
    var  zipCode:                   String?
    var  userType:                  String?
    var  profilePic:                String?
    var  currentPoints:             String?
    var  qualifiedNights:           String?
    var  qualifiedStays:            String?


}

