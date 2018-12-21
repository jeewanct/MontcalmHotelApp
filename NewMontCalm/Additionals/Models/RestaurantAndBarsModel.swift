//
//  OffersTabBarModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class RestaurantsAndBarModel: Decodable{

    var hotels: [RestarurantHotel]?

}

class RestarurantHotel: Decodable{

    var hotelId: String?
    var hotelName: String?
    var restaurants: [RestarurantHotelBars]?

    private enum CodingKeys: String, CodingKey{
        case hotelId = "propertyId"
        case hotelName = "propertyName"
        case restaurants = "restaurants"
    }
}



class RestarurantHotelBars: Decodable{
    var id: String?
    var name: String?
    var imageUrl: String?
    var shortDesc: String?
    var longDesc: String?
 //   var imageGallery: [String]?

    private enum CodingKeys: String, CodingKey{
        case id = "restaurantId"
        case name = "name"
        case imageUrl = "image"
        case shortDesc = "shortDesc"
        case longDesc = "longDesc"
    //    case imageGallery = "imageGallery"
    }

}

