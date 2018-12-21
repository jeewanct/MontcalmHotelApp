//
//  LoginModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class LoginModel: Decodable{

    var errorMessage: String?
    var userDetails: RegisterUserInformationModel?

    private enum CodingKeys: String, CodingKey{
        case errorMessage = "Error_spcMessage"
        case userDetails = "userDetails"
    }


}
