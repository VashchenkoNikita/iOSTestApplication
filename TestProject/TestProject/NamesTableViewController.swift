//
//  NamesTableViewController.swift
//  TestProject
//
//  Created by iMac27 on 07.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {

  var names = ["Piter", "David"]
  var surnames = ["Gilles","Black"]
  var positions = ["Manager","Engineer"]
  var nameImages = ["Gilles.jpg","Black.jpg"]
 
  var searchController: UISearchController!
  

 // let sections = ["A","B","C","D", "E", "F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    searchController = UISearchController(searchResultsController: nil)
    tableView.tableHeaderView = searchController.searchBar
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return names.count
    }//

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cellIdentifier = "Cell"
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NamesTableViewCell

      
      //Configure the cell
      cell.nameLabel?.text = names[indexPath.row]
      cell.surnameLabel?.text = surnames[indexPath.row]
      cell.positionLabel?.text = positions[indexPath.row]
      cell.humbnailImageView.image = UIImage(named:nameImages[indexPath.row])
      
    
      
      return cell
  }
  
     /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
