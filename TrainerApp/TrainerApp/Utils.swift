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
    
}
