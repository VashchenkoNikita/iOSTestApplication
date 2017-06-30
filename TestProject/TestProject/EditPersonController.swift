//
//  EditPersonController.swift
//  TestProject
//
//  Created by iMac27 on 21.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit
import DatePickerDialog
import CoreData

class EditPersonController: UITableViewController,  NSFetchedResultsControllerDelegate {

  @IBOutlet weak var firstNameTextFieid: UITextField!
  @IBOutlet weak var secondNameTextFieid: UITextField!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var surnameTextFieid: UITextField!
  @IBOutlet weak var gender: UISegmentedControl!
  @IBOutlet weak var employed: UITextField!
  @IBOutlet weak var birthdate: UITextField!
  @IBOutlet weak var positionTextFieid: UITextField!
  @IBOutlet weak var commentTextFieid: UITextView!


 
  var workers:WorkersMO!
  var genderSelected = "Male"
  var locdateBirth: Date?
  var locdateEmployed: Date?

  override func viewDidLoad() {
              super.viewDidLoad()
    
    
     photoImageView.image = UIImage(data:workers.image! as Data)
     firstNameTextFieid.text = workers.firstName
     secondNameTextFieid.text = workers.secondName
     surnameTextFieid.text = workers.surname
     genderSelected =  workers.gender!
     employed.text = workers.employeed
     birthdate.text =  workers.birthdate
     positionTextFieid.text = workers.position
     commentTextFieid.text =  workers.comment


    
    // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.pressEdit))
  }
    func pressEdit() {
      
        self.photoImageView.isUserInteractionEnabled = true
        self.firstNameTextFieid.isEnabled = true
        self.secondNameTextFieid.isEnabled = true
        self.surnameTextFieid.isEnabled = true
        self.gender.isEnabled = true
        self.employed.isEnabled = true
        self.birthdate.isEnabled = true
        self.positionTextFieid.isEnabled = true
        self.commentTextFieid.isEditable = true
      
      
      self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.pressSave))
     
    }
    func pressSave() {
    
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.pressEdit))
      
      self.photoImageView.isUserInteractionEnabled = false
      self.firstNameTextFieid.isEnabled = false
      self.secondNameTextFieid.isEnabled = false
      self.surnameTextFieid.isEnabled = false
      self.gender.isEnabled = false
      self.employed.isEnabled = false
      self.birthdate.isEnabled = false
      self.positionTextFieid.isEnabled = false
      self.commentTextFieid.isEditable = false
      
      let isFirstNameEmpty = firstNameTextFieid.text == nil || firstNameTextFieid.text! == ""
      let isSecondNameEmpty = secondNameTextFieid.text == nil || secondNameTextFieid.text == ""
      let isSurnameEmpty = surnameTextFieid.text == nil || surnameTextFieid.text == ""
      let isPositionEmpty = positionTextFieid.text == nil || positionTextFieid.text == ""
      
      var locMassage = ""
      
      
      if isFirstNameEmpty {
        
        locMassage =  "Field First name is not filled in. Please fill it in."
      }
      
      if isSecondNameEmpty {
        
        locMassage = "Field Second name is not filled in. Please fill it in."
      }
      
      if isSurnameEmpty{
        
        locMassage = "Field Surname name is not filled in. Please fill it in."
      }
      
      if isPositionEmpty{
        
        locMassage = "Field Position name is not filled in. Please fill it in."
      }
      
      if locdateEmployed != nil && locdateBirth != nil && locdateBirth!.timeIntervalSinceReferenceDate > locdateEmployed!.timeIntervalSinceReferenceDate {
        
        locMassage = "Date of birth must not exceed the date of employment, correct."
      }
      
      if locMassage != "" {
        let alertController = UIAlertController(title: "Oops", message: locMassage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        
      }
      
      
      if locMassage == "" {
        
        
        print("First name: \(firstNameTextFieid.text ?? "")")
        print("Second Name: \(secondNameTextFieid.text ?? "")")
        print("Surname: \(surnameTextFieid.text ?? "")")
        print("Gender: \(genderSelected)")
        print("Employeed: \(employed.text ?? "")")
        print("Birthdate: \(birthdate.text ?? "")")
        print("Position: \(positionTextFieid.text ?? "")")
        print("Comment: \(commentTextFieid.text ?? "")")
        
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         
          let context = appDelegate.persistentContainer.viewContext
        
        let fetchReguest = NSFetchRequest<NSManagedObject>(entityName: "Employees")
        
        
        do {
           _ =  try context.fetch(fetchReguest)
        
         let managedObject =  self.workers
          
          
            
            managedObject!.setValue(firstNameTextFieid.text, forKey: "firstName")
            managedObject!.setValue(secondNameTextFieid.text, forKey: "secondName")
            managedObject!.setValue(surnameTextFieid.text, forKey: "surname")
            managedObject!.setValue(genderSelected, forKey: "gender")
            managedObject!.setValue(employed.text, forKey: "employeed")
            managedObject!.setValue(birthdate.text, forKey: "birthdate")
            managedObject!.setValue(positionTextFieid.text, forKey: "position")
            managedObject!.setValue(commentTextFieid.text, forKey: "comment")
            
            try context.save()
            
          } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")

          }
      

        
          /*
          workers = WorkersMO(context: appDelegate.persistentContainer.viewContext)
          workers.firstName = firstNameTextFieid.text
          workers.secondName = secondNameTextFieid.text
          workers.surname = surnameTextFieid.text
          workers.gender = genderSelected
          workers.employeed = employed.text
          workers.birthdate = birthdate.text
          workers.position = positionTextFieid.text
          workers.comment = commentTextFieid.text
          
          if let workersImage = photoImageView.image {
            if let imageData = UIImagePNGRepresentation(workersImage){
              workers.image = NSData(data: imageData)
 
            }
          }
 */
          print("Saving data to context ...")
          appDelegate.saveContext()
          
        
  
      }
      dismiss(animated: true, completion: nil)
      tableView.reloadData()
    }


  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    self.tableView.setEditing(editing, animated: animated)
  
  }
  
  // MARK: - Table view data source

       /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
