//
//  HotelGalleryModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 11/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation

class HotelDetailModel: Decodable{


    var hotelId: String?
    var hotelName: String?
    var desc: String?
    var hotelAddress: String?
    var hotelPhoneNo: String?
    var hotelWhatsAppNo: String?
    var gallery: [PhotosModel]?

    // Facilites

    var hotelFacilities: String?
    var roomAminities: String?
    var attractions: String?
    var tvChannels: String?
    var bookingCareCharter: String?


    // All rooms in hotel

    var availableRooms: [HotelRoomsModel]?


    private enum CodingKeys: String, CodingKey{


        case hotelId = "id"
        case hotelName = "propertyName"
        case desc  = "desc"
        case hotelAddress = "address"
        case hotelPhoneNo = "phoneNo"
        case hotelWhatsAppNo = ""
        case gallery = "gallery"
        case hotelFacilities = "hotelFacilities"
        case roomAminities = "roomAmenities"
        case attractions = "attractions"
        case tvChannels = "tvChannels"
        case bookingCareCharter = "bookingCareCharter"
        case availableRooms = "rooms"


    }

}

class PhotosModel: Decodable{

    var imageUrl: String?

}


class HotelRoomsModel: Decodable{

    var hotelId: String?
    var roomId: String?
    var roomName: String?
    var roomImageUrl: String?
    var maxOccupancy: String?
    var roomDesc: String?
    var roomGallery: [PhotosModel]?

    private enum CodingKeys: String, CodingKey {

        case hotelId = "propertyId"
        case roomId = "id"
        case roomName = "name"
        case roomImageUrl = "roomImage"
        case maxOccupancy = "maxOccupancy"
        case roomDesc = "desc"
        case roomGallery = "imageGallery"



    }


}


