//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Alberto on 2/24/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var postCaptionField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postImageView.image = #imageLiteral(resourceName: "image_placeholder")
  }
  
  @IBAction func onImageTapped(_ sender: Any) {
    // Instantiate a UIImagePickerController
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    // Check that camera is supported on device
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      print("Camera is available 📸")
      vc.sourceType = .camera
    } else {
      print("Camera is not available 🚫. Use photo library instead.")
      vc.sourceType = .photoLibrary
    }
    
    self.present(vc, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get image captured by UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do stuff with images
    
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func onCancel(_ sender: Any) {
  }
  
  @IBAction func onPost(_ sender: Any) {
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
