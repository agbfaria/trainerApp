//
//  EvaluationViewController.swift
//  TrainerApp
//
//  Created by Augusto on 9/23/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    
    var isEditingEvaluation = false
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var evaluationDate: UITextField!
    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var inputAge: UITextField!
    @IBOutlet weak var inputHeight: UITextField!
    
    //DC
    @IBOutlet weak var inputDCTriceps: UITextField!
    @IBOutlet weak var inputDCShoulderBlade: UITextField!
    @IBOutlet weak var inputDCBreastplate: UITextField!
    @IBOutlet weak var inputDCChest: UITextField!
    @IBOutlet weak var inputDCSuprailiac: UITextField!
    @IBOutlet weak var inputDCAbdominal: UITextField!
    @IBOutlet weak var inputDCQuadriceps: UITextField!
    @IBOutlet weak var inputDCCalf: UITextField!
    @IBOutlet weak var inputDCAxillary: UITextField!
    @IBOutlet weak var inputDCBiceps: UITextField!
    @IBOutlet weak var inputDCSum: UITextField!
    
    //Perimeter
    @IBOutlet weak var inputLegPerimeter: UITextField!
    @IBOutlet weak var inputThighPerimeter: UITextField!
    @IBOutlet weak var inputPelvisPerimeter: UITextField!
    @IBOutlet weak var inputAbdominalPerimeter: UITextField!
    @IBOutlet weak var inputForearmPerimeter: UITextField!
    @IBOutlet weak var inputArmPerimeter: UITextField!
    @IBOutlet weak var inputContractedArmPerimeter: UITextField!
    
    //Width
    @IBOutlet weak var inputFistWidth: UITextField!
    @IBOutlet weak var inputEpicHumeral: UITextField!
    @IBOutlet weak var inputEpicFemoral: UITextField!
    
    //Faulkner
    @IBOutlet weak var inputIMC: UITextField!
    @IBOutlet weak var inputRCQ: UITextField!
    @IBOutlet weak var inputPercentFat: UITextField!
    @IBOutlet weak var inputPercentFatFree: UITextField!
    @IBOutlet weak var inputPercentFatIdeal: UITextField!
    @IBOutlet weak var inputPercentFatLeftover: UITextField!
    @IBOutlet weak var inputPercentFatLeftoverCopy: UITextField!
    
    @IBOutlet weak var labelInfoFat: UILabel!
    
    @IBOutlet weak var inputFatWeight: UITextField!
    @IBOutlet weak var inputSlimWeight: UITextField!
    @IBOutlet weak var inputIdealWeight: UITextField!
    
    @IBOutlet weak var observationTextBox: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if currentUser.profile == 0 || currentUser.profile == 1 {
            
            isEditingEvaluation = true
            
            saveButton.enabled = true
            
            enableInputs()
            if isEditingEvaluation == true {
                populate()
            } else {
                cleanInputs()
            }
            
        } else {
            
            isEditingEvaluation = false
            
            populate()
        }
    }
    
    func enableInputs(){
        evaluationDate.enabled = true
        inputWeight.enabled = true
        inputHeight.enabled = true
        
        inputDCTriceps.enabled = true
        inputDCShoulderBlade.enabled = true
        inputDCBreastplate.enabled = true
        inputDCChest.enabled = true
        inputDCSuprailiac.enabled = true
        inputDCAbdominal.enabled = true
        inputDCQuadriceps.enabled = true
        inputDCCalf.enabled = true
        inputDCAxillary.enabled = true
        inputDCBiceps.enabled = true
        
        inputLegPerimeter.enabled = true
        inputThighPerimeter.enabled = true
        inputPelvisPerimeter.enabled = true
        inputAbdominalPerimeter.enabled = true
        inputForearmPerimeter.enabled = true
        inputArmPerimeter.enabled = true
        inputContractedArmPerimeter.enabled = true
        
        inputFistWidth.enabled = true
        inputEpicHumeral.enabled = true
        inputEpicFemoral.enabled = true
        
    }
    
    func cleanInputs(){
        evaluationDate.text = dateUtils.getCurrentDateAsString("dd/mm/yyyy")
        inputWeight.text = ""
        inputAge.text = "\(utils.calcAge(selectedUser.dateOfBirth, toDate: NSDate()))"
        inputHeight.text = ""
        inputDCTriceps.text = String()
        inputDCShoulderBlade.text = ""
        inputDCBreastplate.text = ""
        inputDCChest.text = ""
        inputDCSuprailiac.text = ""
        inputDCAbdominal.text = ""
        inputDCQuadriceps.text = ""
        inputDCCalf.text = ""
        inputDCAxillary.text = ""
        inputDCBiceps.text = ""
        inputDCSum.text = ""
        inputLegPerimeter.text = ""
        inputThighPerimeter.text = ""
        inputPelvisPerimeter.text = ""
        inputAbdominalPerimeter.text = ""
        inputForearmPerimeter.text = ""
        inputArmPerimeter.text = ""
        inputContractedArmPerimeter.text = ""
        inputFistWidth.text = ""
        inputEpicHumeral.text = ""
        inputEpicFemoral.text = ""
        inputIMC.text = ""
        inputRCQ.text = ""
        inputPercentFat.text = ""
        inputPercentFatFree.text = ""
        inputPercentFatIdeal.text = ""
        inputPercentFatLeftover.text = ""
        inputPercentFatLeftoverCopy.text = ""
        inputFatWeight.text = ""
        inputSlimWeight.text = ""
        inputIdealWeight.text = ""
        observationTextBox.text = ""
    }
    
    func populate(){
        
        navigationBar.title = "Avaliação \(dateUtils.convertDate(evaluationSelected.evaluationDate, diseredFormat: "dd/MM/yyyy"))"
        
        inputWeight.text = "\(evaluationSelected.weight)"
        inputHeight.text = "\(evaluationSelected.height)"
        
        inputAge.text = "\(utils.calcAge(selectedUser.dateOfBirth, toDate: evaluationSelected.evaluationDate))"
        
        evaluationDate.text = dateUtils.convertDate(evaluationSelected.evaluationDate, diseredFormat: "dd/MM/yyyy")
        
        inputDCTriceps.text = "\(evaluationSelected.triceps)"
        inputDCShoulderBlade.text = "\(evaluationSelected.shoulderBlade)"
        inputDCBreastplate.text = "\(evaluationSelected.breastplate)"
        inputDCChest.text = "\(evaluationSelected.chest)"
        inputDCSuprailiac.text = "\(evaluationSelected.suprailiac)"
        inputDCAbdominal.text = "\(evaluationSelected.abdominal)"
        inputDCQuadriceps.text = "\(evaluationSelected.quadriceps)"
        inputDCCalf.text = "\(evaluationSelected.calf)"
        inputDCAxillary.text = "\(evaluationSelected.axillary)"
        inputDCBiceps.text = "\(evaluationSelected.biceps)"
        inputDCSum.text = "\(evaluationSelected.DCSum())"
        
        
        
        inputLegPerimeter.text = "\(evaluationSelected.legPerimeter)"
        inputThighPerimeter.text = "\(evaluationSelected.thighPerimeter)"
        inputPelvisPerimeter.text = "\(evaluationSelected.pelvisPerimeter)"
        inputAbdominalPerimeter.text = "\(evaluationSelected.abdominalPerimeter)"
        inputForearmPerimeter.text = "\(evaluationSelected.forearmPerimeter)"
        inputArmPerimeter.text = "\(evaluationSelected.armPerimeter)"
        inputContractedArmPerimeter.text = "\(evaluationSelected.contractedArmPerimeter)"
        
        inputFistWidth.text = "\(evaluationSelected.fistWidth)"
        inputEpicHumeral.text = "\(evaluationSelected.epicHumeral)"
        inputEpicFemoral.text = "\(evaluationSelected.epicFemoral)"
        
        inputIMC.text = String(format: "%.3f",( evaluationSelected.getIMC() ) )
        inputRCQ.text = String( format: "%.3f",( evaluationSelected.getRCQ() ) )
        
        inputPercentFat.text = String(format: "%.1f", (evaluationSelected.getPercentFat() ) )
        inputPercentFatFree.text = String(format: "%.1f",(evaluationSelected.getPercentFatFree() ) )
        inputPercentFatIdeal.text = String(format: "%.1f", (evaluationSelected.getPercentFatIdeal(selectedUser) ) )
        inputPercentFatLeftover.text = String(format: "%.1f", (evaluationSelected.getPercentLeftoverFat(selectedUser) ) )
        inputPercentFatLeftoverCopy.text = String(format: "%.1f", ( abs( evaluationSelected.getPercentLeftoverFat( selectedUser ) ) ) )
        
        inputFatWeight.text = String(format: "%.1f", ( evaluationSelected.getFatWeight() ) )
        inputSlimWeight.text = String(format: "%.1f", ( evaluationSelected.getSimWeight() ) )
        inputIdealWeight.text = String(format: "%.1f", (evaluationSelected.getIdealWeight(selectedUser) ) )
        
        if evaluationSelected.getPercentLeftoverFat(selectedUser) > 0 {
                labelInfoFat.text = "acima do percentual ideal de gordura"
        } else {
                labelInfoFat.text = "abaixo do percentual ideal de gordura"
        }
        
        observationTextBox.text = evaluationSelected.observation
        
    }
    
    @IBAction func saveChanges(sender: AnyObject) {
        
        utils.loadingStart(self)
        
        
        if evaluationDate.text != "" { evaluationSelected.evaluationDate = dateUtils.getDateFromString(evaluationDate.text!.componentsSeparatedByString("/")[2], month: evaluationDate.text!.componentsSeparatedByString("/")[1], day: evaluationDate.text!.componentsSeparatedByString("/")[0]) }
        //DC
        if inputWeight.text             != "" { evaluationSelected.weight = Double(inputWeight.text!)! } else { evaluationSelected.weight = 0 }
        if inputHeight.text             != "" { evaluationSelected.height = Double(inputHeight.text!)! } else { evaluationSelected.height = 0 }
        if inputDCTriceps.text          != "" { evaluationSelected.triceps = Int(inputDCTriceps.text!)! } else { evaluationSelected.triceps = 0 }
        if inputDCShoulderBlade.text    != "" { evaluationSelected.shoulderBlade = Int(inputDCShoulderBlade.text!)! } else { evaluationSelected.shoulderBlade = 0 }
        if inputDCBreastplate.text      != "" { evaluationSelected.breastplate = Int(inputDCBreastplate.text!)! } else { evaluationSelected.breastplate = 0 }
        if inputDCChest.text            != "" { evaluationSelected.chest = Int(inputDCChest.text!)! } else { evaluationSelected.chest = 0 }
        if inputDCSuprailiac.text       != "" { evaluationSelected.suprailiac = Int(inputDCSuprailiac.text!)! } else { evaluationSelected.suprailiac = 0 }
        if inputDCAbdominal.text        != "" { evaluationSelected.abdominal = Int(inputDCAbdominal.text!)! } else { evaluationSelected.abdominal = 0 }
        if inputDCQuadriceps.text       != "" { evaluationSelected.quadriceps = Int(inputDCQuadriceps.text!)! } else { evaluationSelected.quadriceps = 0 }
        if inputDCCalf.text             != "" { evaluationSelected.calf = Int(inputDCCalf.text!)! } else { evaluationSelected.calf = 0 }
        if inputDCAxillary.text         != "" { evaluationSelected.axillary = Int(inputDCAxillary.text!)! } else { evaluationSelected.axillary = 0 }
        if inputDCBiceps.text           != "" { evaluationSelected.biceps = Int(inputDCBiceps.text!)! } else { evaluationSelected.biceps = 0 }
        
        //Perimeters
        if inputLegPerimeter.text           != "" { evaluationSelected.legPerimeter = Double(inputLegPerimeter.text!)! } else { evaluationSelected.legPerimeter = 0 }
        if inputThighPerimeter.text         != "" { evaluationSelected.thighPerimeter = Double(inputThighPerimeter.text!)! } else { evaluationSelected.thighPerimeter = 0 }
        if inputPelvisPerimeter.text        != "" { evaluationSelected.pelvisPerimeter = Double(inputPelvisPerimeter.text!)! } else { evaluationSelected.pelvisPerimeter = 0 }
        if inputAbdominalPerimeter.text     != "" { evaluationSelected.abdominalPerimeter = Double(inputAbdominalPerimeter.text!)! } else { evaluationSelected.abdominalPerimeter = 0 }
        if inputForearmPerimeter.text       != "" { evaluationSelected.forearmPerimeter = Double(inputForearmPerimeter.text!)! } else { evaluationSelected.forearmPerimeter = 0 }
        if inputArmPerimeter.text           != "" { evaluationSelected.armPerimeter = Double(inputArmPerimeter.text!)! } else { evaluationSelected.armPerimeter = 0 }
        if inputContractedArmPerimeter.text != "" { evaluationSelected.contractedArmPerimeter = Double(inputContractedArmPerimeter.text!)! } else { evaluationSelected.contractedArmPerimeter = 0 }
        
        //Width
        if inputFistWidth.text   != "" { evaluationSelected.fistWidth = Double(inputFistWidth.text!)! } else { evaluationSelected.fistWidth = 0 }
        if inputEpicHumeral.text != "" { evaluationSelected.epicHumeral = Double(inputEpicHumeral.text!)! } else { evaluationSelected.epicHumeral = 0 }
        if inputEpicFemoral.text != "" { evaluationSelected.epicFemoral = Double(inputEpicFemoral.text!)! } else { evaluationSelected.epicFemoral = 0 }
        
        evaluationSelected.observation = observationTextBox.text
        
        
        if addingEvaluation == true { selectedUser.evaluations.append(evaluationSelected) }
        
        
        //TODO: insert the rest of the inputs
        
        utils.loadingStop()
        utils.alert(self, title: "Dados Salvos", message: "Dados salvos com sucesso", finishButton: "Ok", dismiss:true)
        
    }
    
    @IBAction func back(sender: AnyObject) {
        
        if isEditingEvaluation == true {
            utils.alert(self, title: "Atenção!", message: "Qualquer alteração será perdida se você não salvá-la", firstActionLabel: "Cancelar", dismiss: false, secondAction: backToEvaluationsList, secondActionLabel: "Ok")
        } else {
            backToEvaluationsList()
        }
        
    }
    
    func backToEvaluationsList() {
        self.performSegueWithIdentifier("backToEvaluationsListSegue", sender: self)
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
