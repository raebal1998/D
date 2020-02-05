//
//  SignUpController.swift
//  Home
//
//  Created by Lama Alherbish on 1/31/20.
//  Copyright © 2020 Lama Alherbish. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpController: UIViewController {
    
   
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0 
    }
    
    
    
    func validateTextField () -> String? {
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "please fill all fields."
        } //it will remove all spaces and lines
        
        
        let passToBeCheck = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if statics.isPasswordValid(passToBeCheck) == false {
            return "please make sure your password length is 8 , and have one alpha and one special character"
            
        }
        let emailToBeCheck = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if statics.isValidEmail(emailToBeCheck) == false {
            return "Please enter a valid email"
            
        }
        
        
        return nil
    }
    
    
    
    
    @IBAction func signUp(_ sender: Any) {
        
        //validate
        let error = validateTextField()
        
        if error != nil { //that's means that there's an error
            errorLabel.text = error!
            errorLabel.alpha = 1
        } else {
        
          let firstName =  FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            
            
        //create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error Creating the user
                    self.errorLabel.text = "error in creating user"
                    self.errorLabel.alpha = 1
                } else {
                    //user was created successfully , now we have to store the data of the user
                    
                    let db = Firestore.firestore() // refrence to the firebase obj
                    db.collection("users").addDocument(data: ["FirstName":firstName , "uid": result!.user.uid]) { (err) in
                        
                        if err != nil {
                            self.errorLabel.text = "TRY AGAIN LATER , couldn't save your data"
                            self.errorLabel.alpha = 1
                        }
                    }
                }
            }
        

        
        //transmit to Home page
            let storyboard = self.storyboard?.instantiateViewController(identifier: statics.HomeViewController) as! HomeController
            
            self.navigationController?.pushViewController(storyboard, animated: true)
            
        
            
          //  view.window?.makeKeyAndVisible() //it will show that the home controller is the root
            //hidesBackButton = true
            storyboard.navigationItem.hidesBackButton = true
    }
    
    
}
}
