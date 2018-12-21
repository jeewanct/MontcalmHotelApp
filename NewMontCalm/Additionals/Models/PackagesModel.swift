//
//  OffersTabBarModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class PackagesModel: Decodable{

    var hotels: [PackagesHotelDetails]?

}

class PackagesHotelDetails: Decodable{

    var hotelId: String?
    var hotelName: String?
    var packages: [PackagesDetails]?

    private enum CodingKeys: String, CodingKey{
        case hotelId = "propertyId"
        case hotelName = "propertyName"
        case packages = "packages"
    }
}



class PackagesDetails: Decodable{
    var id: String?
    var name: String?
    var imageUrl: String?
    var shortDesc: String?
    var longDesc: String?

    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "packageName"
        case imageUrl = "image"
        case shortDesc = "shortDesc"
        case longDesc = "longDesc"
    }

}





