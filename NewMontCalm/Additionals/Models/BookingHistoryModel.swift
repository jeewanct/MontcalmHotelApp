//
//  BookingHistoryModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 19/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class BookingHistoryModel: Decodable{


    var upcomingBooking: [BookingInformationModel]?
    var previousBooking: [BookingInformationModel]?
    var cancelledBooking: [BookingInformationModel]?
    var errorMessage : String?

    private enum CodingKeys: String, CodingKey{
        case upcomingBooking = "upcomingBooking"
        case previousBooking = "previousBooking"
        case cancelledBooking = "cancelledBooking"
        case errorMessage = "Error_spcMessage"
    }



}

class BookingInformationModel: Decodable{

    var hotelName: String?
    var bookingId: String?
    var bookingDate: String?
    var checkInDate: String?
    var checkOutDate: String?
    var price: String?

}
