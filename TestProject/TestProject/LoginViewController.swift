//
//  ViewController.swift
//  TestProject
//
//  Created by iMac27 on 02.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin


class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    // Add a custom login button to your app
    
    let myLoginButton = UIButton(type: .custom)
    myLoginButton.backgroundColor = UIColor.blue
    myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
    myLoginButton.center = view.center
    myLoginButton.setTitle("Log in with Facebook", for: .normal)
    
    // Handle clicks on the button
    myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
    
    // Add the button to the view
    view.addSubview(myLoginButton)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
   self.navigationController?.setNavigationBarHidden(false, animated: false)
  }
  // Once the button is clicked, show the login dialog
  @objc func loginButtonClicked() {
    let loginManager = LoginManager()
    loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
      switch loginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login.")
      case .success( _, _,  _):
        self.performSegue(withIdentifier: "showNames", sender: nil)
     print("Logged in!")
       
      }
    }
  }
  /*
  func loginButtonDidLogOut(_ loginButton: LoginButton) {
    switch result {
    case .failed(let error):
      print(error)
      break
    case .cancelled:
      print("Cancelled")
    case .success(let grantedPermissions, let declinedPermissions, let accessToken):
      performSegue(withIdentifier: "showNames", sender: nil)
      print("Logged In")
  
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if  segue.identifier == "showNames" {
      let destinationController = segue.destination as! NamesTableViewController
      
    }
 
 }
 
*/
}
