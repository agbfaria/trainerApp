//
//  Utils.swift
//  TrainerApp
//
//  Created by Augusto on 9/22/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit
import Foundation

let utils = Utils()

class Utils {
    
    var activityIndicatior: UIActivityIndicatorView =  UIActivityIndicatorView()
    
    
    
    
    func loadingStart(UIView:UIViewController){
        activityIndicatior = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicatior.center = UIView.view.center
        activityIndicatior.hidesWhenStopped = true
        activityIndicatior.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        UIView.view.addSubview(activityIndicatior)
    }
    
    func loadingStop(){
        self.activityIndicatior.stopAnimating()
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    func alert(UIView:UIViewController, title:String, message:String, finishButton:String, dismiss:Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: finishButton, style: UIAlertActionStyle.Default, handler: { (action) in
            if dismiss == true {
                UIView.dismissViewControllerAnimated(true, completion: nil)
            }
        }))
        
        
        
        UIView.presentViewController(alert, animated: true, completion: nil)
    }
    
    func alert(UIView:UIViewController, title:String, message:String, firstActionLabel:String, dismiss:Bool, secondAction:Void -> Void, secondActionLabel:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: firstActionLabel, style: UIAlertActionStyle.Default, handler: { (action) in
            if dismiss == true {
                UIView.dismissViewControllerAnimated(true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: secondActionLabel, style: UIAlertActionStyle.Default, handler: { (action) in
            secondAction()
            if dismiss == true {
                UIView.dismissViewControllerAnimated(true, completion: nil)
            }
            
        }))
        
        UIView.presentViewController(alert, animated: true, completion: nil)
    }
    
    func alert(UIView:UIViewController, title:String, message:String, firstActionLabel:String, firstAction:Void -> Void, dismiss:Bool, secondAction:Void -> Void, secondActionLabel:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: firstActionLabel, style: UIAlertActionStyle.Default, handler: { (action) in
            firstAction()
            if dismiss == true {
                UIView.dismissViewControllerAnimated(true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: secondActionLabel, style: UIAlertActionStyle.Default, handler: { (action) in
            secondAction()
            if dismiss == true {
                UIView.dismissViewControllerAnimated(true, completion: nil)
            }
            
        }))
        
        UIView.presentViewController(alert, animated: true, completion: nil)
    }
    
    func calcAge(fromDate:NSDate, toDate:NSDate) -> Int {
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//        let now: NSDate! = NSDate()
        let calcAge = calendar.components(.Year, fromDate: fromDate, toDate: toDate, options: [])
        let age = calcAge.year
        return age
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    func sortPersonalTrainers(){
        listPersonalTrainers.sortInPlace{ $0.name < $1.name }
    }
    
    func sortStudents(){
        listStudents.sortInPlace{ $0.name < $1.name }
    }
    
    func sortEvaluations(){
        selectedUser.evaluations.sortInPlace{ dateUtils.convertDate($0.evaluationDate, diseredFormat: "yyyyMMdd") < dateUtils.convertDate($1.evaluationDate, diseredFormat: "yyyyMMdd") }
    }
    
    func logout(UIView:UIViewController){
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "email")
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "password")
        
        UIView.performSegueWithIdentifier("loginViewSegue", sender: UIView)
    }
    
    func readCSVFile(fileName: String){
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")!
        
        do {
            let csv = try TDTOpenner(contentsOfURL: path)
            let rows = csv.rows
            
            let e = Evaluation()

            e.evaluationDate = dateUtils.getDateFromString(rows[0][7]!, month: rows[0][6]!, day: rows[0][5]!)
            e.weight =      Double(validReturn(rows[2][1]!))!
            e.height =      Double(validReturn(rows[3][1]!))!
            
            e.triceps =         Int(validReturn(rows[7][1]!))!
            e.shoulderBlade =   Int(validReturn(rows[8][1]!))!
            e.breastplate =     Int(validReturn(rows[9][1]!))!
            e.chest =           Int(validReturn(rows[10][1]!))!
            e.suprailiac =      Int(validReturn(rows[11][1]!))!
            e.abdominal =       Int(validReturn(rows[12][1]!))!
            e.quadriceps =      Int(validReturn(rows[13][1]!))!
            e.calf =            Int(validReturn(rows[14][1]!))!
            e.axillary =        Int(validReturn(rows[15][1]!))!
            e.biceps =          Int(validReturn(rows[16][1]!))!
            
            e.legPerimeter =            Double(validReturn(rows[20][1]!))!
            e.thighPerimeter =          Double(validReturn(rows[21][1]!))!
            e.pelvisPerimeter =         Double(validReturn(rows[22][1]!))!
            e.abdominalPerimeter =      Double(validReturn(rows[23][1]!))!
            e.forearmPerimeter =        Double(validReturn(rows[24][1]!))!
            e.armPerimeter =            Double(validReturn(rows[25][1]!))!
            e.contractedArmPerimeter =  Double(validReturn(rows[26][1]!))!
            
            e.fistWidth =   Double(validReturn(rows[28][1]!))!
            e.epicHumeral = Double(validReturn(rows[29][1]!))!
            e.epicFemoral = Double(validReturn(rows[30][1]!))!
            
            var obs: String = "\(rows[35][2]!)\n"
            for i in 31  ..< rows.count  {
                if var row = rows[i][1] where row != "" {
                    if row.characters.first == "\"" {
                        row = String(row.characters.dropFirst())
                    }
                    if row.characters.last == "\"" {
                        row = String(row.characters.dropLast())
                    }
                    obs += "\(row)\n"
                }
            }
            
            e.observation = obs
            
            selectedUser.evaluations.append(e)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func trim(str: String) -> String {
        return str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func validReturn(str: String) -> String {
        if str != "" && trim(str) != "-" {
            return str
        }
        return "0"
    }
    
}
