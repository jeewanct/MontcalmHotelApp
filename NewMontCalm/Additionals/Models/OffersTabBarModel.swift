//
//  OffersTabBarModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class OffersTabBarModel: Decodable{

    var hotels: [OffersTabBarHotels]?

}

class OffersTabBarHotels: Decodable{

    var hotelId: String?
    var hotelName: String?
    var offers: [OffersTabBarHotelOffers]?

    private enum CodingKeys: String, CodingKey{
        case hotelId = "propertyId"
        case hotelName = "propertyName"
        case offers = "offers"
    }
}



class OffersTabBarHotelOffers: Decodable{
    var offerId: String?
    var offerName: String?
    var minimumNights: String?
    var offerImageUrl: String?
    var shortDesc: String?
    var longDesc: String?

    private enum CodingKeys: String, CodingKey{
        case offerId = "id"
        case offerName = "offerName"
        case minimumNights = "minimumNights"
        case offerImageUrl = "image"
        case shortDesc = "shortDesc"
        case longDesc = "longDesc"
    }

}
