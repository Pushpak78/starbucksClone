//
//  SignUpModel.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 27/07/22.
//

import UIKit

struct UserData : Codable {
    
    var firstName : String = ""
    var lastName : String = ""
    var mobileNumber : String? = nil
    var pincode: String? = nil
    var referalcode : String? = nil
    var email : String = ""
    var password : String = ""
}
