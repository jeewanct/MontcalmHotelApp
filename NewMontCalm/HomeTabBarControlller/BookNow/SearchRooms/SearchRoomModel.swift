//
//  SearchRoomModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 04/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class SearchRoomModel: Decodable{

    var list: [RoomList]?
}

class RoomList: Decodable{

    var hotelId: String?
    var hotelName: String?
    var hotelImage: String?
    var starRank: String?

    private enum CodingKeys: String, CodingKey {
        case hotelId = "hotel_id"
        case hotelName = "hotel_name"
        case hotelImage = "hotel_image"
        case starRank = "star_rank"
    }
}
