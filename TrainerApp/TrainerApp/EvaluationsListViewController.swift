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
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        utils.sortEvaluations()
        self.table.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedUser.evaluations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // Configure the cell... dateUtils.convertDate(evaluationSelected.evaluationDate, diseredFormat: "dd/MM/yyyy")
        cell.textLabel?.text = "Avaliação \(dateUtils.convertDate(selectedUser.evaluations[indexPath.row].evaluationDate, diseredFormat: "dd/MM/yyyy"))"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        addingEvaluation = false
        evaluationSelected = selectedUser.evaluations[indexPath.row]
        self.performSegueWithIdentifier("openEvaluation", sender: self)
        
    }
    
    @IBAction func addEvaluation(sender: AnyObject) {
        addingEvaluation = true
        evaluationSelected = Evaluation()
        self.performSegueWithIdentifier("openEvaluation", sender: self)
    }

    @IBAction func logout(sender: AnyObject) {
        utils.logout(self)
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
