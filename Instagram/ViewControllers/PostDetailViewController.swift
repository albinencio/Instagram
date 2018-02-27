//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Alberto on 2/25/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import Parse

class PostDetailViewController: UIViewController {
  
  @IBOutlet weak var picView: UIImageView!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var captionLabel: UILabel!
  
  var post: PFObject?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    let caption = post!["caption"] as! String
    captionLabel.text = caption
    let timestamp = post!.createdAt
    timeLabel.text = dateFormatter(date: timestamp)
    let picture = post!["media"] as! PFFile
    picture.getDataInBackground { (imageData, error) in
      if error == nil {
        let image = UIImage(data: imageData!)
        self.picView.image = image
      } else {
        print(error?.localizedDescription ?? "Error instance was nil")
      }
    }
  }
  
  func dateFormatter(date: Date?) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "🗓 MMM dd"
    let formatted = formatter.string(from: date!)
    return formatted
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
