//
//  RateTypeModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class RateTypeModel: Decodable{

    var rateTypeRules: [RateTypeRulesModel]?
    var roomTypesRules: [RateRoomDetailsModels]?

     private enum CodingKeys: String, CodingKey{
        case rateTypeRules = "rate_rules_details"
        case roomTypesRules = "room_rate_rule_details"
    }
}

class RateTypeRulesModel: Decodable{

    var pmsRateRuleId: String?
    var rateRuleId: String?
    var appliedRateRuleId: String?
    var appliedPmsRateId: String?
    var rateName: String?
    var rateImage: String?
    var desc: String?
    var ruleType: String?
    var featuredImage: String?
    var rooms: [RateRoomDetailsModels]?
    var numberOfRooms: String?
    var roomUnit: String?


    private enum CodingKeys: String, CodingKey{

        case pmsRateRuleId = "pms_rate_rule_id"
        case rateRuleId = "rate_rule_id"
        case appliedRateRuleId = "applied_rate_rule_id"
        case appliedPmsRateId = "applied_pms_rate_code"
        case rateName = "rate_name"
        case rateImage = "rate_image"
        case desc = "long_desc"
        case ruleType = "rate_rule_type"
        case featuredImage = "featured_image"
        case rooms = "Rooms"
        case numberOfRooms = "numberof Rooms"
        case roomUnit = "room_type_units"

    }


}

class RateRoomDetailsModels: Decodable{

    var price: String?
    var totalPrice: String?
    var roomTypeId: String?
    var roomId: String?
    var roomImage: String?
    var pmsRoomType: String?
    var roomName: String?
    var rateType: [RateTypeRulesModel]?
    var roomUnits: String?
    var maxAdults: String?
    var numberOfRooms: String?
   // var rooms: String?

    private enum CodingKeys: String, CodingKey{

        case price = "Price"
        case totalPrice = "Total_Price"
        case roomTypeId = "room_type_id"
        case roomId = "id"
        case roomImage = "room_image"
        case pmsRoomType = "pms_room_type"
        case roomName = "room_type"
        case rateType = "room_rules"
        case roomUnits =   "room_type_units"
        case maxAdults = "max_adults"
        case numberOfRooms = "numberof Rooms"
       // case rooms = "room"



    }



}
