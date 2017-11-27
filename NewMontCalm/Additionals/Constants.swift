//
//  Constants.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


class Constants{


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
        static let HOMEURL = "https://api.themontcalm.com/V2/ws"
        static let LOGIN = "/TheMontcalmClub/loginUser"
        static let HOTELLIST = "/getAvailableHotels"
        static let HOTELFACILITIES = "/getHotelFacilityList"
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

