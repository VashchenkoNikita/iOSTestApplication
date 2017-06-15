//
//  NamesTableViewController.swift
//  TestProject
//
//  Created by iMac27 on 07.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {

  var workers:[Employees] = [
    Employees(firstName: "Piter",secondName: "Bob", surname: "Gilles", gender:
      "Male", birthdate: "01.01.1970",  position: "Manager", employeed: "12.12.2012", image: "Gilles.jpg", comment: "Good employees"),
    Employees(firstName: "David",secondName: "Tom", surname: "Black", gender:
      "Male", birthdate: "02.02.1972",  position: "Engineer", employeed: "10.10.2012", image: "Black", comment: "Good employees")
  ]
  

  var searchController: UISearchController!
  

 // let sections = ["A","B","C","D", "E", "F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    searchController = UISearchController(searchResultsController: nil)
    tableView.tableHeaderView = searchController.searchBar
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workers.count
    }//

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cellIdentifier = "Cell"
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NamesTableViewCell

      
      //Configure the cell
      cell.nameLabel?.text = workers[indexPath.row].firstName
      cell.surnameLabel?.text = workers[indexPath.row].surname
      cell.positionLabel?.text = workers[indexPath.row].position
      cell.humbnailImageView.image = UIImage(named:workers[indexPath.row].image)
      
    
      
      return cell
  }
  
  
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
          workers.remove(at: indexPath.row)
          
          }
    
      tableView.deleteRows(at: [indexPath], with: .fade)
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    tableView.reloadData()
  }
  @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
  }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  }
*/
}
