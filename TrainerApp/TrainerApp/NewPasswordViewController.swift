//
//  NewPasswordViewController.swift
//  TrainerApp
//
//  Created by Augusto on 10/9/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {

    @IBOutlet weak var inputPassword1: UITextField!
    
    @IBOutlet weak var inputPassword2: UITextField!
    
//    @IBOutlet weak var imgCheck1: UIImageView!
    @IBOutlet weak var imgCheck2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputPassword1.addTarget(self, action:#selector(NewPasswordViewController.checkPassword1), forControlEvents:.EditingChanged)
        
        inputPassword2.addTarget(self, action:#selector(NewPasswordViewController.checkPassword2), forControlEvents:.EditingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if inputPassword1.text?.characters.count >= 5 && inputPassword1.text == inputPassword2.text {
            
            currentUser.password = inputPassword2.text!
            currentUser.tempPassword = false
            
            if currentUser.profile == 0 || currentUser.profile == 1 {
                self.performSegueWithIdentifier("showUsersListSegue", sender: self)
            } else {
                selectedUser = currentUser
                self.performSegueWithIdentifier("showEvaluationListFromLoginSegue", sender: self)
            }
        } else {
            utils.alert(self, title: "ERROR", message: "As senhas devem ser iguais.\nPor favor, tente novamente", finishButton: "OK", dismiss: false)
        }
    }
    
    func checkPassword1(){
//        if inputPassword1.text?.characters.count >= 5 {
//            switchImage(imgCheck1, checked: true)
//        } else {
//            switchImage(imgCheck1, checked: false)
//        }
        if inputPassword2.text != "" {
            checkPassword2()
        }
    }
    
    func checkPassword2(){
        if inputPassword1.text == inputPassword2.text {
            switchImage(imgCheck2, checked: true)
        } else {
            switchImage(imgCheck2, checked: false)
        }
    }
    
    func switchImage(imgView:UIImageView, checked:Bool){
        if checked {
            imgView.image = UIImage(named: "checked")
        } else {
            imgView.image = UIImage(named: "x")
        }
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
