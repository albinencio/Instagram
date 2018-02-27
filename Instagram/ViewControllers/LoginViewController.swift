//
//  LoginViewController.swift
//  Instagram
//
//  Created by Alberto on 2/20/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import Parse
import Pastel

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var usernameSubview: UIView!
  @IBOutlet weak var passwordSubview: UIView!
  @IBOutlet weak var loginSubview: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    usernameField.delegate = self
    passwordField.delegate = self
    
    let pastelView = PastelView(frame: self.view.bounds)
    
    // Custom Direction
    pastelView.startPastelPoint = .bottomLeft
    pastelView.endPastelPoint = .topRight
    
    // Custom Duration
    pastelView.animationDuration = 3.0
    
    // Custom Color
    pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                          UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                          UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                          UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                          UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                          UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                          UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
    
    pastelView.startAnimation()
    view.insertSubview(pastelView, at: 0)
    
    usernameSubview.layer.cornerRadius = 3
    passwordSubview.layer.cornerRadius = usernameSubview.layer.cornerRadius
    loginSubview.layer.borderColor = usernameSubview.layer.backgroundColor
    loginSubview.layer.borderWidth = 1
    loginSubview.layer.cornerRadius = usernameSubview.layer.cornerRadius
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onSignIn(_ sender: Any) {
    PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user, error) in
      if user != nil {
        print("Logged in successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil) // Transition to next view
      } else {
        print(error?.localizedDescription ?? "Error instance is nil")
      }
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.usernameField.resignFirstResponder()
    self.passwordField.resignFirstResponder()
    return true
  }
  
  @IBAction func onSignUp(_ sender: Any) {
    let newUser = PFUser()
    
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    
    newUser.signUpInBackground { (success, error) in
      if success {
        print("User created successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil) // Transition to next view
      } else {
        print(error?.localizedDescription ?? "Error instance is nil")
        
        // Handle different error codes
        let code = error?._code
        switch code {
        case 202?:
          print("Username is already taken")
          break
        default:
          break
        }
      }
    }
  }
  
}
