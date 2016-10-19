//
//  AddUserViewController.swift
//  TrainerApp
//
//  Created by Augusto on 9/23/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    
    var passwordDefault = "marciosoares"
    
    @IBOutlet weak var newUserName: UITextField!
    @IBOutlet weak var newUserEmail: UITextField!
    @IBOutlet weak var newUserDocument: UITextField!
    @IBOutlet weak var newUserDOB: UITextField!
    @IBOutlet weak var isStudentCheckbox: UIButton!
    @IBOutlet weak var isAdminCheckbox: UIButton!
    @IBOutlet weak var profileSelector: UISegmentedControl!
    
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        if isEdittingUser == false {
            newUserName.text = ""
            newUserEmail.text = ""
            newUserDOB.text = ""
            newUserDocument.text = ""
            
            forgetPasswordLabel.alpha = 0
            resetPasswordButton.alpha = 0
            
            navigationBar.title = "Adicionar Usuário"
        } else {
            newUserName.text = selectedUser.name
            newUserEmail.text = selectedUser.email
            newUserDOB.text = dateUtils.convertDate(selectedUser.dateOfBirth, diseredFormat: "dd/MM/yyy")
            newUserDocument.text = selectedUser.document
            
            resetPasswordButton.alpha = 1
            
            navigationBar.title = "Editar Usuário"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewUser(sender: AnyObject) {
        if newUserName.text == "" || newUserDOB.text == "" || newUserEmail.text == "" || newUserDocument.text == ""{
            
            utils.alert(self, title: "Error", message: "Favor preencher todos os campos", finishButton: "Ok", dismiss:false)
            
        } else if utils.isValidEmail(newUserEmail.text!) == false {
            
            utils.alert(self, title: "Error", message: "E-mail inválido.\nPor favor, revise o e-mail informado", finishButton: "Ok", dismiss:false)
            
        } else {
            
            var newUser = User()
            
            if isEdittingUser == true {
                newUser = selectedUser
            }
            newUser.name = newUserName.text!
            
            newUser.dateOfBirth = dateUtils.getDateFromString(newUserDOB.text!.componentsSeparatedByString("/")[2], month: newUserDOB.text!.componentsSeparatedByString("/")[1], day: newUserDOB.text!.componentsSeparatedByString("/")[0])
            
            newUser.email = newUserEmail.text!
            //            newUser.evaluations = nil
            newUser.password = passwordDefault
            newUser.document = newUserDocument.text!
            
            
            var message:String
            
            if profileSelector.selectedSegmentIndex == 0 {
                newUser.profile = 2
                if isEdittingUser == false { listStudents.append(newUser) }
                utils.sortStudents()
                message = "O(A) cadastro do(a) aluno(a) \(newUser.name) "
            } else if profileSelector.selectedSegmentIndex == 1 {
                newUser.profile = 1
                if isEdittingUser == false { listPersonalTrainers.append(newUser) }
                utils.sortPersonalTrainers()
                message = "O(A) cadastro do(a) instrutor(a) \(newUser.name) "
            } else {
                newUser.profile = 0
                if isEdittingUser == false { listAdmins.append(newUser) }
                utils.sortPersonalTrainers()
                message = "O(A) cadastro do(a) administrador(a) \(newUser.name) "
            }
            
            if isEdittingUser == true {
                message += "foi atualizado(a) com sucesso"
            } else {
                message += "foi realizado com sucesso"
            }
            
            utils.alert(self, title: "Sucesso!", message: message, finishButton: "Ok", dismiss:true)
        }
    }
    
    @IBAction func resetPassword(sender: AnyObject) {
        utils.alert(self, title: "Atenção!", message: "Tem certeza que deseja resetar a senha de \(selectedUser.name)?", firstActionLabel: "Cancelar", dismiss: false, secondAction: resetPassword, secondActionLabel: "Resetar")
    }
    
    func resetPassword(){
        selectedUser.password = passwordDefault
        selectedUser.tempPassword = true
        utils.alert(self, title: "Sucesso!", message: "Senha resetada com sucesso!", finishButton: "Ok", dismiss:true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
