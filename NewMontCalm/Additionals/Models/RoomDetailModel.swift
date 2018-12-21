//
//  HotelGalleryModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 11/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class RoomDetailModel: Decodable{


    var roomId: String?
    var roomName: String?
    var roomImage: String?
    var desc: String?
    var roomAddress: String?
    var roomPhoneNo: String?
    var hotelWhatsAppNo: String?
    var gallery: [PhotosModel]?

    // Facilites

    var roomFacilities: String?
    var roomAminities: String?
    var attractions: String?
    var tvChannels: String?
    var bookingCareCharter: String?

    var roomFacilitiesImage: String?
    var roomAminitiesImage: String?
    var attractionsImage: String?
    var tvChannelsImage: String?
    var bookingCareCharterImage: String?


    private enum CodingKeys: String, CodingKey{


        case roomId = "id"
        case roomName = "roomName"
        case desc  = "desc"
        case roomAddress = "address"
        case roomPhoneNo = "phoneNo"
        case hotelWhatsAppNo = ""
        case gallery = "imageGallery"
        case roomFacilities = "facilities"
        case roomAminities = "amenities"
        case attractions = "attractions"
        case tvChannels = "tvChannels"
        case bookingCareCharter = "bookingCareCharter"
        case roomImage = "roomImage"


        case roomFacilitiesImage = "facilities_image"
        case roomAminitiesImage = "amenities_image"
        case attractionsImage = "attractions_image"
        case tvChannelsImage = "tvChannels_image"
        case bookingCareCharterImage = "bookingCareCharter_image"

    }

}




