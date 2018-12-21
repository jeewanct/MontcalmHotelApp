//
//  AvailableHotelsModel.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 14/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class AvailableHotelsModel: Decodable{
    
   
    var hotelList: [ListOfAvailableHotels]?
    
    private enum CodingKeys: String, CodingKey {
        case hotelList = "list"
    }
    
}


class ListOfAvailableHotels: Decodable{
    
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
    var pmsHotelCode: String?
    var propertyStatus: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case hotelId  = "hotel_id"
        case hotelName = "hotel_name"
        case hotelAddress = "address"
        case hotelTelNo = "phone"
        case hotelWhatsAppNo = "whatsup_no"
        case hotelLat = "latLocation"
        case hotelLang = "langLocation"
        case hotelRating = "star_rank"
        case hotelImageUrl = "hotel_image"
        case startingPrice = "minimum_rate"
        case pmsHotelCode = "pms_hotel_code"
        case propertyStatus = "property_status"
    }
    
    
}


