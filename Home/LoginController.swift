//
//  LoginController.swift
//  Home
//
//  Created by Lama Alherbish on 1/30/20.
//  Copyright © 2020 Lama Alherbish. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController:UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0 //to hide the lable
    }
    
    func validateTextField () -> String? {
              
              if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                  return "please fill all fields."
              } //it will remove all spaces and lines
           
           let passToBeCheck = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                 
                 if statics.isPasswordValid(passToBeCheck) == false {
                     return "The password is incorect"
       }
           return nil
           
       }
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
               
        self.activityIndicator.startAnimating()
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        loginButton.isEnabled = false
               
        // validate text fields
        let error = validateTextField()
                      
        if error != nil { //that's means that there's an error
            errorLabel.text = error!
            errorLabel.alpha = 1
               } else {
                      
                 let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                      
                          
                          
        //signin the user
                       
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                           
                           
       if error != nil {
           self.activityIndicator.stopAnimating()
           self.errorLabel.text = "The combination of email and password is incorrect"
            self.errorLabel.alpha = 1
        } else {
                               //transmit to Home page
             self.activityIndicator.stopAnimating()
            let storyboard = self.storyboard?.instantiateViewController(identifier: statics.HomeViewController) as! HomeController
                               
            self.navigationController?.pushViewController(storyboard, animated: true)
                               
            self.view.window?.rootViewController = storyboard
                               
            self.view.window?.makeKeyAndVisible() //it will show that the home controller is the root
           storyboard.navigationItem.hidesBackButton = true
            storyboard.navigationItem.rightBarButtonItem = nil
            
      }
                      }
                         
               
           }
               
           }
           
    
}
