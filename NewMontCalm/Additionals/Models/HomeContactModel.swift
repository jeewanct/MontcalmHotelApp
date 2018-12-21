//
//  HomeContactModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class HomeContactModel: Decodable{

    var termsAndCondition: String?
    var whyBookHere: String?
    var privacyStatement: String?
    var hotelList: [ListOfAvailableHotels]?
    
    private enum CodingKeys: String, CodingKey {
        case termsAndCondition = "terms"
        case whyBookHere = "why"
        case privacyStatement = "privacy"
        case hotelList = "contact"
    }

}




class ListOfHotelModel: Decodable{

    var hotelId: String?
    var hotelName: String?
    var hotelAddress: String?
    var hotelTelNo: String?
    var hotelWhatsAppNo: String?
    var hotelLat: String?
    var hotelLang: String?
    var hotelRating: String?
    var hotelImageUrl: String?
    var startingPrice: String?

    private enum CodingKeys: String, CodingKey {
        
        case hotelId  = "propertyId"
        case hotelName = "propertyName"
        case hotelAddress = "address"
        case hotelTelNo = "tel"
        case hotelWhatsAppNo = "whatsup_no"
        case hotelLat = "lat"
        case hotelLang = "lang"
        case hotelRating = "rating"
        case hotelImageUrl = "hotel_image"
        case startingPrice = "min_price"
        
    }


}


