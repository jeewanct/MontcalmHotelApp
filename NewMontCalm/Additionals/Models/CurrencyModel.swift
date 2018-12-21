//
//  CurrencyModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class CurrencyModel: Decodable{
    var status: String?
    var currency: [GetCurrency]?
}

class GetCurrency: Decodable{

    var title: String?
    var abbrevation: String?
    var symbol: String?
    var value: String?

}
