//
//  OffersTabBarModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class WellnessModel: Decodable{

    var hotels: [WellnessHotels]?

}

class WellnessHotels: Decodable{

    var hotelId: String?
    var hotelName: String?
    var restaurants: [WellnessHotelsSpa]?

    private enum CodingKeys: String, CodingKey{
        case hotelId = "propertyId"
        case hotelName = "propertyName"
        case restaurants = "restaurants"
    }
}



class WellnessHotelsSpa: Decodable{
    var id: String?
    var name: String?
    var imageUrl: String?
    var shortDesc: String?
    var longDesc: String?
    var imageGallery: [String]?

    private enum CodingKeys: String, CodingKey{
        case id = "spaId"
        case name = "name"
        case imageUrl = "image"
        case shortDesc = "shortDesc"
        case longDesc = "longDesc"
        case imageGallery = "imageGallery"
    }

}

