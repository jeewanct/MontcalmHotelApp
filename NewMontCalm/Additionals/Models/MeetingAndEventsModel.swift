//
//  OffersTabBarModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 07/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class MeetingAndEventsModel: Decodable{

    var hotels: [MeetingEventsHotel]?

}

class MeetingEventsHotel: Decodable{

    var hotelId: String?
    var hotelName: String?
    var meetings: [MeetingEventsHotelDetails]?

    private enum CodingKeys: String, CodingKey{
        case hotelId = "propertyId"
        case hotelName = "propertyName"
        case meetings = "meetings"
    }
}



class MeetingEventsHotelDetails: Decodable{
    var id: String?
    var name: String?
    var imageUrl: String?
    var shortDesc: String?
    var longDesc: String?
   // var imageGallery: [String]?

    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case imageUrl = "image"
        case shortDesc = "shortDesc"
        case longDesc = "longDesc"
      //  case imageGallery = "imageGallery"
    }

}




