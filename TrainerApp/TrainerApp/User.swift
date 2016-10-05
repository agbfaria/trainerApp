//
//  User.swift
//  TrainerApp
//
//  Created by Augusto on 9/22/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import Foundation

class User {
    
    var name = String()
    
    var email = String()
    
    var password = String()
    
    var dateOfBirth = NSDate()
    
    var document = String()
    
    var profile = Int8()
    
    var active = true
    
    var evaluations = [Evaluation]()
    
}