//
//  AddPersonController.swift
//  TestProject
//
//  Created by iMac27 on 15.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit

class AddPersonController: UITableViewController, UINavigationControllerDelegate , UIImagePickerControllerDelegate {
  
  @IBOutlet weak var firstNameTextFieid: UITextField!

  @IBOutlet weak var secondNameTextFieid: UITextField!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var surnameTextFieid: UITextField!

 

  @IBOutlet weak var gender: UISegmentedControl!
  
  @IBOutlet weak var employedDataPicker: UITextField!
  @IBOutlet weak var birthdateDatePicker: UITextField!
  @IBOutlet weak var positionTextFieid: UITextField!
  @IBOutlet weak var commentTextFieid: UITextView!
  
var genderSelected = "Male"
  
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
