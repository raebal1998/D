//
//  statics.swift
//  Home
//
//  Created by Lama Alherbish on 1/31/20.
//  Copyright © 2020 Lama Alherbish. All rights reserved.
//

import Foundation
import UIKit

class statics {
    
    static let HomeViewController = "HomeVC"
    static let NavViewController = "Nav"
    
    
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }// it will check that the password have one alpha and one special character and it's length is 8
    
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }//end of the method
    
    
    
}
