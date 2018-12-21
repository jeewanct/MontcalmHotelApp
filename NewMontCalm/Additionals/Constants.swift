//
//  Constants.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


class Constants{


    //http://apithemontcalm.neowebservices.co.uk/api/V2/ws/getAvailableRooms
//http://apithemontcalm.neowebservices.co.uk/api/V2/ws/getAvailableEnhancements

//    {
//    "propertyId": "94",
//    "checkIn": "2018-01-15",
//    "checkOut": "2018-01-16",
//    "sortBy": "Price",
//    "sortOrder": "asc",
//    "promoCode": "",
//    "room_detail_info": [
//    {
//    "rate_rule_id": "2748",
//    "isDefaultStatus": false,
//    "rate_rule_name": "Bed and Breakfast Select",
//    "included_packages": "LIGHTBR:",
//    "max_adults": "2",
//    "applied_rate_rule_id": "2",
//    "pms_rate_rule_id": "PMOBBS",
//    "room_type_name": "Deluxe Double (Complimentary Internet)",
//    "rate_rule_type": "spl",
//    "room_type_id": "445",
//    "room_units": "1",
//    "adult_per_room": [
//    2
//    ]
//    },
//    {
//    "rate_rule_id": "2748",
//    "isDefaultStatus": false,
//    "rate_rule_name": "Bed and Breakfast Select",
//    "included_packages": "LIGHTBR:",
//    "max_adults": "2",
//    "applied_rate_rule_id": "2",
//    "pms_rate_rule_id": "PMOBBS",
//    "room_type_name": "Executive Club Double(Complimentary Internet)",
//    "rate_rule_type": "spl",
//    "room_type_id": "127",
//    "room_units": "1",
//    "adult_per_room": [
//    2
//    ]
//    },
//    {
//    "rate_rule_id": "2",
//    "isDefaultStatus": true,
//    "rate_rule_name": "Best Available Rate",
//    "included_packages": "",
//    "max_adults": "2",
//    "applied_rate_rule_id": "0",
//    "pms_rate_rule_id": "BMCEB",
//    "room_type_name": "Montcalm Club Twin(Complimentary Internet)",
//    "rate_rule_type": "bar",
//    "room_type_id": "135",
//    "room_units": "1",
//    "adult_per_room": [
//    2
//    ]
//    }
//    ]
//    }
//    {
//    "checkIn": "2017-12-15",
//    "checkOut": "2017-12-16",
//    "propertyId": "128"
//    }

    struct Fonts{
        static let FONTLIGHT = "LATO-LIGHT"
        static let FONTREGULAR = "LATO-REGULAR"
    }

    struct StandardSize{
        static let TABLEROWHEIGHT = (UIScreen.main.bounds.width - 32) * 9 / 16
    }
    
    struct ApisUrl{
        static let GOOGLEAPI = "AIzaSyDfC0pHPv-eCmUFbIrtuWrJL2Ci2wRjeDI"


    }

    struct CustomApis{
        
        static let HOMEURL = "http://apithemontcalm.neowebservices.co.uk" 
        static let LOGIN = "/TheMontcalmClub/loginUser"
        static let GETCURRENCY = "/api/V2/ws/getAllCurrencies"
        static let GETCOUNTRYLIST = "/api/V2/ws/getAllCountries"
        static let GETTEMPERATURE = ""
        static let GETHOMECONTACT = "/api/V2/ws/getAllContacts"
        static let GETAVAILABLEHOTEL = "/api/V2/ws/getAvailableHotels"


        static let GETWELLNESS = "/api/V2/ws/getAllSpa"
        static let GETRESTAURANTANDBAR = "/api/V2/ws/getAllRestaurants"
        static let GETPACKAGES = "/api/V2/ws/getAllPackages"
        static let GETMEETINGANDEVENTS = "/api/V2/ws/getAllMeetingEvents"
        static let GETSPECIFICHOTELDETAIL = "/api/V2/ws/getHotelDetails"
        static let GETSPECIFICROOMDETAIL = "/api/V2/ws/getRoomDetails"
        static let GETOFFERS = "/api/V2/ws/getAllOffers"

        static let REGISTERUSER = "/api/V2/ws/TheMontcalmClub/registerUser"
        static let LOGINUSER = "/api/V2/ws/TheMontcalmClub/loginUser"
        static let UPDATEUSERDETAILS = "/api/V2/ws/TheMontcalmClub/updateUserProfile"
        // Avaialable rooms
        static let GETAVAILABELROOMS = "/api/V2/ws/getAvailableRooms"
        static let GETBOOKINGHISTORY = "/api/V2/ws/getReservationHistory"

    }
    
    struct AlertConstants{
        
    }
    
    struct NetworkConstants{
        
    }
    
    struct Appearance{
        static let BACKGROUNDCOLOR = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        static let NAVIGATIONTINTCOLOR = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let BUTTONBACKGROUNDCOLOR = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let BUTTONTITLECOLOR = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let PRIMARYCOLOR = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        static let SECONDARYCOLOR = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        
    }



    
}

