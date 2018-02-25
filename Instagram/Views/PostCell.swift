//
//  PostCell.swift
//  Instagram
//
//  Created by Alberto on 2/24/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
  
  @IBOutlet weak var photoView: UIImageView!
  @IBOutlet weak var captionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
