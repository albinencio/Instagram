//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Alberto on 2/24/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var postCaptionTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postImageView.isUserInteractionEnabled = true
    postCaptionTextView.delegate = self
    
    postImageView.image = #imageLiteral(resourceName: "image_placeholder")
    postCaptionTextView.text = "Write a caption..."
    postCaptionTextView.textColor = UIColor.lightGray
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if postCaptionTextView.textColor == UIColor.lightGray {
      postCaptionTextView.text = ""
      postCaptionTextView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if postCaptionTextView.text == "" {
      postCaptionTextView.text = "Write a caption..."
      postCaptionTextView.textColor = UIColor.lightGray
    }
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
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    // Resize image and set it to postImageView
    postImageView.image = resize(image: editedImage, newSize: postImageView.frame.size)
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func onCancel(_ sender: Any) {
    
  }
  
  @IBAction func onPost(_ sender: Any) {
    
  }
  
  func resize(image: UIImage, newSize: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    let resizeImageView = UIImageView(frame: rect)
    resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
    resizeImageView.image = image
    
    UIGraphicsBeginImageContext(resizeImageView.frame.size)
    resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
