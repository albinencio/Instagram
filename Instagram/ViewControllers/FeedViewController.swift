//
//  FeedViewController.swift
//  Instagram
//
//  Created by Alberto on 2/23/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onLogOut(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
  }
  
}
