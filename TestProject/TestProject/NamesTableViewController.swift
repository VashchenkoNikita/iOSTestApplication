//
//  NamesTableViewController.swift
//  TestProject
//
//  Created by iMac27 on 07.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit
import CoreData

class NamesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

  /*var workers:[Employees] = [
    Employees(firstName: "Piter",secondName: "Bob", surname: "Gilles", gender:
      "Male", birthdate: "01.01.1970",  position: "Manager", employeed: "12.12.2012", image: "Gilles.jpg", comment: "Good employees"),
    Employees(firstName: "David",secondName: "Tom", surname: "Black", gender:
      "Male", birthdate: "02.02.1972",  position: "Engineer", employeed: "10.10.2012", image: "Black", comment: "Good employees")
  ]
  */
  var workers:[WorkesMO] = []

  var searchController: UISearchController!
  var fetchResultController: NSFetchedResultsController<WorkesMO>!

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    searchController = UISearchController(searchResultsController: nil)
    tableView.tableHeaderView = searchController.searchBar
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    // Fetch data from data store
    let fetchRequest: NSFetchRequest<WorkesMO> = WorkesMO.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "surname", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
     if  let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
      let context = appDelegate.persistentContainer.viewContext
      fetchResultController = NSFetchedResultsController(fetchRequest:
        fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil,
                      cacheName: nil)
      fetchResultController.delegate = self
      do {
        try fetchResultController.performFetch()
        if let fetchedObjects = fetchResultController.fetchedObjects {
          workers = fetchedObjects
        }
      } catch {
        print(error)
      } }
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
      cell.humbnailImageView.image = UIImage(data:workers[indexPath.row].image! as Data)
      
    
      
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
 override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
  let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action,indexPath) -> Void in
    if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
      let context = appDelegate.persistentContainer.viewContext
      let worksToDelete = self.fetchResultController.object(at:indexPath)
      context.delete(worksToDelete)
      appDelegate.saveContext()
    }
  })
  return [deleteAction]
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    tableView.reloadData()
  }
  @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
  }
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      if let newIndexPath = newIndexPath {
        tableView.insertRows(at: [newIndexPath], with: .fade)
      }
    case .delete:
      if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
    case .update:
      if let indexPath = indexPath {
        tableView.reloadRows(at: [indexPath], with: .fade)
      } default:
        tableView.reloadData()
    }
    if let fetchedObjects = controller.fetchedObjects {
      workers = fetchedObjects as! [WorkesMO]
     }
    }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
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
