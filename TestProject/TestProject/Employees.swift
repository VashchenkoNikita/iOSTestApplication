//
//  Employees.swift
//  TestProject
//
//  Created by iMac27 on 13.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import Foundation

class Employees {
  var firstName = ""
  var secondName = ""
  var surname = ""
  var position = ""
  var gender = ""
  var birthdate = ""
  var employeed = ""
  var image = ""
  var comment = ""
  
  init(firstName: String,secondName: String, surname: String, gender: String, birthdate: String,  position: String, employeed: String, image: String, comment: String) {
    self.firstName = firstName
    self.secondName = secondName
    self.surname = surname
    self.gender = gender
    self.birthdate = birthdate
    self.position = position
    self.employeed = employeed
    self.image = image
    self.comment = comment
  }
}
