//
//  EnhancmentParameterModel.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 18/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class EnhancmentParameterModel: Codable{

    var propertyId: String?
    var checkIn: String?
    var checkOut: String?
    var sortBy: String?
    var sortOrder: String?
    var promoCode: String?
    var roomDetailInfor: [EnhancmentRoomModel]?

    private enum CodingKeys: String, CodingKey{
       case propertyId  =  "propertyId"
       case checkIn  = "checkIn"
       case checkOut =  "checkOut"
       case sortBy  = "sortBy"
       case sortOrder =  "sortOrder"
       case promoCode  = "promoCode"
       case roomDetailInfor = "room_detail_info"

    }

}

class EnhancmentRoomModel: Codable{
    var rateRuleId: String?
    var isDefaultStatus: String?
    var rateRuleName: String?
    var includedPackage: String?
    var maxAdults: String?
    var appliedRateRuleId: String?
    var pmsRateRuleId: String?
    var roomTypeName: String?
    var rateRuleType: String?
    var roomTypeId: String?
    var roomUnit: String?
    var adultPerRoom: [String]?

    private enum CodingKeys: String, CodingKey{
        case rateRuleId = "rate_rule_id"
        case isDefaultStatus = "isDefaultStatus"
        case rateRuleName = "rate_rule_name"
        case includedPackage = "included_packages"
        case maxAdults = "max_adults"
        case appliedRateRuleId = "applied_rate_rule_id"
        case pmsRateRuleId =  "pms_rate_rule_id"
        case roomTypeName = "room_type_name"
        case rateRuleType = "rate_rule_type"
        case roomTypeId = "room_type_id"
        case roomUnit = "room_units"
        case adultPerRoom = "adult_per_room"

    }


}
