//
//  ViewController.swift
//  TrainerApp
//
//  Created by Augusto on 9/22/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit


var listPersonalTrainers = [User()]
var listStudents = [User()]
var listAdmins = [User()]
var listUsers = [User()]
var currentUser:User = User()
var selectedUser:User = User()

class ViewController: UIViewController {
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateUsers()
    }

    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults.standardUserDefaults().objectForKey("email") != nil {
            inputEmail.text = NSUserDefaults.standardUserDefaults().objectForKey("email") as? String
            inputPassword.text = NSUserDefaults.standardUserDefaults().objectForKey("password") as? String
            
            singUp(self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func singUp(sender: AnyObject) {
        utils.loadingStart(self)
        
        if inputEmail.text == "" || inputPassword.text == "" {
            utils.alert(self, title:"Erro", message: "Por favor preencha todos os campos", finishButton: "OK", dismiss:false)
        } else {
            for u in listUsers {
                if u.email == inputEmail.text! && u.password == inputPassword.text! {
                    if u.active == true {
                        currentUser = u
                        
                        NSUserDefaults.standardUserDefaults().setObject(inputEmail.text, forKey: "email")
                        NSUserDefaults.standardUserDefaults().setObject(inputPassword.text, forKey: "password")
                        
                        
                    } else {
                        let message = "Este usuário se encontra inativo.\nFavor contatar o seu personal trainer para mais informações"
                        utils.alert(self, title:"Erro", message: message, finishButton: "OK", dismiss:false)
                    }
                    break
                }
            }
            
            if currentUser.email == inputEmail.text {
                if currentUser.tempPassword {
                    self.performSegueWithIdentifier("setNewPasswordSegue", sender: self)
                } else {
                    if currentUser.profile == 0 || currentUser.profile == 1 {
                        self.performSegueWithIdentifier("showUsersListSegue", sender: self)
                    } else {
                        selectedUser = currentUser
                        self.performSegueWithIdentifier("showEvaluationListFromLoginSegue", sender: self)
                    }
                }
            } else {
                utils.alert(self, title:"Erro", message: "E-mail e/ou senha não identificado(s)", finishButton: "OK", dismiss:false)
            }
            
        }
        
        utils.loadingStop()
    }
    
    func populateUsers(){
        
        listUsers.removeAll()
        listPersonalTrainers.removeAll()
        listStudents.removeAll()
        listAdmins.removeAll()
        
        var user: User = User()
        user.name = "Aggy"
        user.email = "aggy"
        user.password = "aggy"
        user.profile = 0
        user.document = "123.456.789-11"
        
        listUsers.append(user)
        
        
        user = User()
        user.name = "Marcio"
        user.email = "marcio"
        user.password = "marcio"
        user.profile = 0
        user.document = "123.456.789-11"
        
        listUsers.append(user)
        
        
        user = User()
        user.name = "Alexandre"
        user.email = "alexandre"
        user.password = "alexandre"
        user.profile = 1
        user.document = "123.456.789-11"
        
        listUsers.append(user)
        
        
        
        user = User()
        user.name = "paulinha"
        user.email = "paulinha"
        user.password = "paulinha"
        user.profile = 2
        user.tempPassword = true
        user.dateOfBirth = dateUtils.getDateFromString("1990", month: "03", day: "29")
            user.document = "123.456.789-11"
        
        var evaluation = Evaluation()
        
        evaluation.height = 1.65
        evaluation.weight = 92.4
        evaluation.evaluationDate = dateUtils.getDateFromString("2016", month: "06", day: "16")        
        //DC
        evaluation.abdominal = 24
        evaluation.axillary = 0
        evaluation.biceps = 6
        evaluation.shoulderBlade = 18
        evaluation.calf = 13
        evaluation.breastplate = 12
        evaluation.quadriceps = 15
        evaluation.suprailiac = 23
        evaluation.chest = 6
        evaluation.triceps = 16
        
        //Perimetros
        evaluation.abdominalPerimeter = 94.5
        evaluation.forearmPerimeter = 29.0
        evaluation.contractedArmPerimeter = 36.6
        evaluation.armPerimeter = 31.8
        evaluation.thighPerimeter = 53.0
        evaluation.pelvisPerimeter = 103.5
        evaluation.legPerimeter = 39.8
        
        //Largura
        evaluation.epicFemoral = 0
        evaluation.epicHumeral = 6
        evaluation.fistWidth = 5.1
        
        user.evaluations.append(evaluation)
        
        listUsers.append(user)
        
        
        user = User()
        user.name = "guilherme"
        user.email = "gui"
        user.password = "gui"
        user.profile = 2
        user.dateOfBirth = dateUtils.getDateFromString("1984", month: "11", day: "19")
        user.document = "123.456.789-11"
        
        evaluation = Evaluation()
        
        evaluation.height = 1.85
        evaluation.weight = 92.4
        evaluation.evaluationDate = dateUtils.getDateFromString("2016", month: "08", day: "15")
        
        //DC
        evaluation.abdominal = 24
        evaluation.axillary = 0
        evaluation.biceps = 6
        evaluation.shoulderBlade = 18
        evaluation.calf = 13
        evaluation.breastplate = 12
        evaluation.quadriceps = 15
        evaluation.suprailiac = 23
        evaluation.chest = 6
        evaluation.triceps = 16
        
        //Perimetros
        evaluation.abdominalPerimeter = 94.5
        evaluation.forearmPerimeter = 29.0
        evaluation.contractedArmPerimeter = 36.6
        evaluation.armPerimeter = 31.8
        evaluation.thighPerimeter = 53.0
        evaluation.pelvisPerimeter = 103.5
        evaluation.legPerimeter = 39.8
        
        //Largura
        evaluation.epicFemoral = 0
        evaluation.epicHumeral = 6
        evaluation.fistWidth = 5.1
        
        user.evaluations.append(evaluation)
        
        listUsers.append(user)
        
        
        
        
        user = User()
        user.name = "augusto"
        user.email = "augusto"
        user.password = "augusto"
        user.profile = 2
        user.dateOfBirth = dateUtils.getDateFromString("1988", month: "07", day: "12")
        user.document = "123.456.789-11"
        
        evaluation = Evaluation()
        
        evaluation.height = 1.845
        evaluation.weight = 92.4
        evaluation.evaluationDate = dateUtils.getDateFromString("2016", month: "08", day: "15")
        
        //DC
        evaluation.abdominal = 24
        evaluation.axillary = 0
        evaluation.biceps = 6
        evaluation.shoulderBlade = 18
        evaluation.calf = 13
        evaluation.breastplate = 12
        evaluation.quadriceps = 15
        evaluation.suprailiac = 23
        evaluation.chest = 6
        evaluation.triceps = 16
        
        //Perimetros
        evaluation.abdominalPerimeter = 94.5
        evaluation.forearmPerimeter = 29.0
        evaluation.contractedArmPerimeter = 36.6
        evaluation.armPerimeter = 31.8
        evaluation.thighPerimeter = 53.0
        evaluation.pelvisPerimeter = 103.5
        evaluation.legPerimeter = 39.8
        
        //Largura
        evaluation.epicFemoral = 0
        evaluation.epicHumeral = 6
        evaluation.fistWidth = 5.1
        
        user.evaluations.append(evaluation)
        
        evaluation = Evaluation()
        
        evaluation.height = 1.845
        evaluation.weight = 92.4
        evaluation.evaluationDate = dateUtils.getDateFromString("2016", month: "10", day: "29")
        
        //DC
        evaluation.abdominal = 24
        evaluation.axillary = 0
        evaluation.biceps = 6
        evaluation.shoulderBlade = 18
        evaluation.calf = 13
        evaluation.breastplate = 12
        evaluation.quadriceps = 15
        evaluation.suprailiac = 23
        evaluation.chest = 6
        evaluation.triceps = 16
        
        //Perimetros
        evaluation.abdominalPerimeter = 94.5
        evaluation.forearmPerimeter = 29.0
        evaluation.contractedArmPerimeter = 36.6
        evaluation.armPerimeter = 31.8
        evaluation.thighPerimeter = 53.0
        evaluation.pelvisPerimeter = 103.5
        evaluation.legPerimeter = 39.8
        
        //Largura
        evaluation.epicFemoral = 0
        evaluation.epicHumeral = 6
        evaluation.fistWidth = 5.1
        
        user.evaluations.append(evaluation)
        
        listUsers.append(user)
        
        for u in listUsers {
            if u.profile == 2 {
                listStudents.append(u)
            } else if u.profile == 1 {
                listPersonalTrainers.append(u)
            } else {
                listAdmins.append(u)
            }
        }
        
        utils.sortPersonalTrainers()
        utils.sortStudents()
    }

}

