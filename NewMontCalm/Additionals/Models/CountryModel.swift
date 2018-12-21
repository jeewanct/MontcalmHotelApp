//
//  CountryModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class CountryModel: Decodable{

    var country: [GetCountry]?
}

class GetCountry: Decodable{

    var countryName: String?
    var countryCode: String?

}
