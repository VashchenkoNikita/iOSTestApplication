//
//  AddPersonController.swift
//  TestProject
//
//  Created by iMac27 on 15.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit
import DatePickerDialog
import CoreData

class AddPersonController: UITableViewController, UINavigationControllerDelegate , UIImagePickerControllerDelegate  {
  
  @IBOutlet weak var firstNameTextFieid: UITextField!
  @IBOutlet weak var secondNameTextFieid: UITextField!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var surnameTextFieid: UITextField!
  @IBOutlet weak var gender: UISegmentedControl!
  @IBOutlet weak var employed: UITextField!
  @IBOutlet weak var birthdate: UITextField!
  @IBOutlet weak var positionTextFieid: UITextField!
  @IBOutlet weak var commentTextFieid: UITextView!
  
  var genderSelected = "Male"
  var workers:WorkersMO!
  var locdateBirth: Date?
  var locdateEmployed: Date?
  
  @IBAction func choseImage(_ sender: Any) {
    
    
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    
    let actionSheet = UIAlertController(title: "Photo Source", message: "", preferredStyle: .actionSheet)
    
    
    actionSheet.addAction(UIAlertAction(title: "From Gallery", style: .default, handler: {(action:UIAlertAction) in
      imagePickerController.sourceType = .photoLibrary
      self.present(imagePickerController, animated: true, completion: nil)
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
    
    
    self.present(actionSheet, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Add person"
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
  
  //    override func numberOfSections(in tableView: UITableView) -> Int {
  //        // #warning Incomplete implementation, return the number of sections
  //        return 0
  //    }
  //
  //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //        // #warning Incomplete implementation, return the number of rows
  //        return 0
  //    }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    photoImageView.image = image
    picker.dismiss(animated: true, completion: nil)
    
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  @IBAction func ChangeGender(_ sender: AnyObject) {
    switch sender.selectedSegmentIndex {
    case 0 : genderSelected = "Male"
    case 1 : genderSelected = "Female"
    default: break
    }
  }
  @IBAction func birthdateTapped(_ sender: Any) {
    DatePickerDialog().show(title: "DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
      (dateBirth) -> Void in
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd.MM.yyyy"
      
      self.birthdate.text = "\(dateBirth)"
      self.locdateBirth = dateBirth
      
      self.birthdate.text = dateFormatter.string(from: dateBirth!)
    }
  }
  
  @IBAction func employedTapped(_ sender: Any) {
    DatePickerDialog().show(title: "DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
      (dateEmployed) -> Void in
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd.MM.yyyy"
      
      self.employed.text = "\(dateEmployed)"
      self.locdateEmployed = dateEmployed
      
      
      self.employed.text = dateFormatter.string(from: dateEmployed!)
    }
  }
  
  
  @IBAction func save(_ sender: Any) {
    
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
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
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
          print("Saving data to context ...")
          appDelegate.saveContext()
          
        }
        
      }
      dismiss(animated: true, completion: nil)
    
  }
  
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
