//
//  LoginViewController.swift
//  Instagram
//
//  Created by Alberto on 2/20/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
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
