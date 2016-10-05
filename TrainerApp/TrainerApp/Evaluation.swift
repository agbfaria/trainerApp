//
//  Evaluation.swift
//  TrainerApp
//
//  Created by Augusto on 9/22/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import Foundation

class Evaluation {
    
    //DC
    var triceps:        Int = Int()
    var shoulderBlade:  Int = Int()//Escapula
    var breastplate:    Int = Int()//Peitoral
    var chest:          Int = Int()//toraxica
    var suprailiac:     Int = Int()
    var abdominal:      Int = Int()
    var quadriceps:     Int = Int()
    var calf:           Int = Int()//panturrilha
    var axillary:       Int = Int()
    var biceps:         Int = Int()
    
    //Perímetros
    var legPerimeter:               Double = Double()
    var thighPerimeter:             Double = Double()//coxaPerim
    var pelvisPerimeter:            Double = Double()
    var abdominalPerimeter:         Double = Double()
    var forearmPerimeter:           Double = Double()
    var armPerimeter:               Double = Double()
    var contractedArmPerimeter:     Double = Double()
    
    //Largura
    var fistWidth:    Double = Double()//punhoLarg
    var epicHumeral:  Double = Double()//epicUmero
    var epicFemoral:  Double = Double()//epicFemur
    
    var evaluationDate: NSDate = NSDate()
    var weight:         Double = Double()
    var height:         Double = Double()
    
    var observation:    String = String()
    
    
    
    
    func getIMC() -> Double {
        return weight / ( height * height )
    }
    
    func getRCQ() -> Double {
        return  abdominalPerimeter / pelvisPerimeter
    }
    
    func DCSum () -> Int {
        var sum = triceps + shoulderBlade + breastplate + chest + suprailiac + abdominal
        sum += quadriceps + calf + axillary + biceps
        return sum
    }
    
    func getPercentFat() -> Double {
        return (Double) ( triceps + shoulderBlade + suprailiac + abdominal ) * 0.153 + 5.783
    }
    
    func getPercentFatFree() -> Double {
        return 100 - getPercentFat()
    }
    
    func getPercentFatIdeal(u:User) -> Double {
        return (Double) ( 12 + (Double)( utils.calcAge(u.dateOfBirth, toDate: NSDate()) - 30 ) * 0.2)
    }
    
    func getPercentLeftoverFat(u:User) -> Double {
        return getPercentFat() - getPercentFatIdeal(u)
    }
    
    func getFatWeight() -> Double {
        return weight * getPercentFat() / 100
    }
    
    func getSimWeight() -> Double {
        return weight * getPercentFatFree() / 100
    }
    
    func getIdealWeight(u:User) -> Double {
        // [ (peso*(%livreGordura/100))/(1-(%idealGord/100)) ]
        return ( ( weight * ( getPercentFatFree() / 100 ) ) / ( 1 - ( getPercentFatIdeal(u) / 100 ) ) )
    }

    
}