//
//  LogicHelper.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 14/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class LogicHelper{
    
    static let shared = LogicHelper()
    
    func returnDayDateYear(date: Date){
        
        let changeDate = addOneToDate(date: date)
        
        print(getDayName(date: changeDate))
        print(getYear(date: changeDate))
        print(getMonth(date: changeDate))
        print(getDate(date: changeDate))
        
    }
    
    func addOneToDate(date: Date) -> Date{
        
        var components = DateComponents()
        components.day = 1
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: components, to: date)!
        
    }
    
    func getDayName(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: date)
        
    }
    
    func getYear(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY"
        return dateFormatter.string(from: date)
        
    }
    
    func getMonth(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        return dateFormatter.string(from: date)
        
    }
    
    func getDate(date: Date) -> String{
        
        let calendar = Calendar.current
        return String(calendar.component(.day, from: date))
        
    }
    
    func convertDateToServerFormat(date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print(formatter.string(from: date))
        return   formatter.string(from: date)
        
    }
    
    func convertDateToTitle(date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        print(formatter.string(from: date))
        return   formatter.string(from: date)
        
    }
    
    
}
