//
//  FeedViewController.swift
//  Instagram
//
//  Created by Alberto on 2/23/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var posts: [PFObject] = []
  
  override func viewWillAppear(_ animated: Bool) {
    getPosts()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 50
    tableView.separatorInset = .zero
    
    // Initialize refresh control
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
    tableView.insertSubview(refreshControl, at: 0)
  }
  
  @IBAction func onLogOut(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    let post = posts[indexPath.row]
    let caption = post["caption"] as! String
    cell.captionLabel.text = caption
    let picture = post["media"] as! PFFile
    picture.getDataInBackground { (imageData, error) in
      if error == nil {
        let image = UIImage(data: imageData!)
        cell.photoView.image = image
      } else {
        print(error?.localizedDescription ?? "Error instance was nil")
      }
    }
    return cell
  }
  
  @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
    getPosts()
    refreshControl.endRefreshing()
  }
  
  func getPosts() {
    // Construct query
    let query = Post.query()
    query?.order(byDescending: "createdAt")
    query?.includeKey("author")
    query?.limit = 20
    
    // Fetch data asynchronously
    query?.findObjectsInBackground(block: { (posts, error) in
      if let posts = posts {
        self.posts = posts
      } else {
        print(error?.localizedDescription ?? "Error instance was nil")
      }
    })
    
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
