//
//  UsersViewController.swift
//  TrainerApp
//
//  Created by Augusto on 9/23/16.
//  Copyright © 2016 Aggy Development Ltda. All rights reserved.
//

import UIKit


var isEdittingUser = false
var workingWithTeachers = false

class UsersViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var activeUsers: UISegmentedControl!
    var listActiveUsers = [User]()

    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        updateListActiveUsers()
        self.table.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listActiveUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = listActiveUsers[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedUser = listActiveUsers[indexPath.row]
        if selectedUser.profile == 2 {
        self.performSegueWithIdentifier("showEvaluationListFromUsersListSegue", sender: self)
        }
        
    }
    
    @IBAction func addUser(sender: AnyObject) {
        isEdittingUser = false
        self.performSegueWithIdentifier("addUserSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") { action, index in
            selectedUser = self.listActiveUsers[indexPath.row]
            isEdittingUser = true
            
            self.performSegueWithIdentifier("addUserSegue", sender: self)
        }
        edit.backgroundColor = UIColor.blueColor()
        
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            utils.alert(self, title: "Apagar Usuário", message: "Tem certeza que deseja apagar este usuário?", firstActionLabel: "Cencelar", dismiss: false, secondAction: self.deleteUser, secondActionLabel: "Apagar")
        }
        
        delete.backgroundColor = UIColor.redColor()
        
        return [delete, edit]
    }
    
    func deleteUser(){
        selectedUser.active = false
    }

    func updateListActiveUsers(){
        if activeUsers.selectedSegmentIndex == 0 {
            listActiveUsers = listStudents
        } else if activeUsers.selectedSegmentIndex == 1 {
            listActiveUsers = listPersonalTrainers
        } else {
            listActiveUsers = listAdmins
        }
    }

    @IBAction func changeActiveUsers(sender: AnyObject) {
        updateListActiveUsers()
        self.table.reloadData()
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
