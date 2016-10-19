//
//  EvaluationsListViewController.swift
//  TrainerApp
//
//  Created by Augusto on 9/23/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit


var evaluationSelected:Evaluation = Evaluation()
var addingEvaluation = false


class EvaluationsListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var addEvaluationButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentUser.profile == 0 || currentUser.profile == 1 {
            backButton.enabled = true
            addEvaluationButton.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        updateView()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedUser.evaluations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Avaliação \(dateUtils.convertDate(selectedUser.evaluations[indexPath.row].evaluationDate, diseredFormat: "dd/MM/yyyy"))"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        addingEvaluation = false
        evaluationSelected = selectedUser.evaluations[indexPath.row]
        self.performSegueWithIdentifier("openEvaluation", sender: self)
        
    }
    
    @IBAction func addEvaluationTapped(sender: AnyObject) {
        utils.alert(self, title: "Adicionar Avaliação", message: "Você deseja adicionar uma nova avaliação manualmente ou fazer o upload de um arquivo?", firstActionLabel: "Upload", firstAction: uploadFile, dismiss: false, secondAction: addNewEvaluation, secondActionLabel: "Manual")

    }
    
    func uploadFile(){
        utils.readCSVFile("ap7")
        utils.readCSVFile("ap6")
        
        updateView()
    }
    

    
    func addNewEvaluation(){
        addingEvaluation = true
        evaluationSelected = Evaluation()
        self.performSegueWithIdentifier("openEvaluation", sender: self)
    }

    @IBAction func logout(sender: AnyObject) {
        utils.logout(self)
    }
    
    func updateView(){
        utils.sortEvaluations()
        self.table.reloadData()
    }

}
