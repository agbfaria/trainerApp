//
//  DateUtils.swift
//  TrainerApp
//
//  Created by Augusto on 9/24/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import Foundation

let dateUtils = DateUtils()

class DateUtils {
    
    
    
    func getDateFromString(year:String, month:String, day:String) -> NSDate {
        let strDate = "\(year)-\(month)-\(day)"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString( strDate )!
    }
    
    func getCurrentDateAsString(desiredFormat:String) -> String {
        let date = NSDate()
        return convertDate(date, diseredFormat: desiredFormat)
    }
    
    func convertDate(date:NSDate, diseredFormat:String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateFormatter.dateFormat = diseredFormat
        
        return "\(dateFormatter.stringFromDate(date))"
    }
    
    func convertDate(dateString:String, diseredFormat:String, actualFormat:String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = actualFormat
        
        let dateObj = dateFormatter.dateFromString(dateString)
        
        dateFormatter.dateFormat = diseredFormat
        
        return "\(dateFormatter.stringFromDate(dateObj!))"
    }
    
}