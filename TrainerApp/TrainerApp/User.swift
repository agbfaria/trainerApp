//
//  User.swift
//  TrainerApp
//
//  Created by Augusto on 9/22/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import Foundation

class User {
    
    private var _name = String()
    
    private var _email = String()
    
    private var _password = String()
    
    private var _dateOfBirth = NSDate()
    
    private var _document = String()
    
    private var _profile = Int8()
    
    private var _active = true
    
    private var _evaluations = [Evaluation]()
    
    private var _tempPassword = false
    
    
    var name : String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue
        }
    }
    
    var password: String {
        get {
            return _password
        }
        set {
            _password = newValue
        }
    }
    
    var dateOfBirth: NSDate {
        get {
            return _dateOfBirth
        }
        set {
            _dateOfBirth = newValue
        }
    }
    
    var document: String {
        get {
            return _document
        }
        set {
            _document = newValue
        }
    }
    
    var profile: Int8 {
        get {
            return _profile
        }
        set {
            _profile = newValue
        }
    }
    
    var active: Bool {
        get {
            return _active
        }
        set {
            _active = newValue
        }
    }
    
    var evaluations: [Evaluation] {
        get {
            return _evaluations
        }
        set {
            _evaluations = newValue
        }
    }
    
    var tempPassword: Bool {
        get {
            return _tempPassword
        }
        set {
            _tempPassword = newValue
        }
    }
    
}