//
//  NamesTableViewCell.swift
//  TestProject
//
//  Created by iMac27 on 07.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit

class NamesTableViewCell: UITableViewCell {

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var surnameLabel: UILabel!
  @IBOutlet var positionLabel: UILabel!
  @IBOutlet var humbnailImageView: UIImageView!
  

  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
