//
//  LoginDetailsView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 27/07/22.
//

import UIKit

class LoginDetailsView : UIView {
    
    let loginDetailLbl = UILabel()
    let emailTxtField = FloatingLabelTextField()
    let usernameDescLabel = UILabel()
    let confirmEmailTxtField = FloatingLabelTextField()
    let passwordTxtField = FloatingLabelTextField()
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        addStyle()
        addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: styles & Layout Constraints

extension LoginDetailsView : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        loginDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        loginDetailLbl.text = "Login Details"
        loginDetailLbl.font = UIFont.preferredFont(forTextStyle: .title2).bold()
        
        emailTxtField.translatesAutoresizingMaskIntoConstraints = false
        emailTxtField.floatingLabelColor = .darkGreen
        emailTxtField.placeholder = "Email"
        
        usernameDescLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameDescLabel.text = "This will be your username."
        usernameDescLabel.font = UIFont.preferredFont(forTextStyle: .footnote).bold()
        
        confirmEmailTxtField.translatesAutoresizingMaskIntoConstraints = false
        confirmEmailTxtField.floatingLabelColor = .darkGreen
        confirmEmailTxtField.placeholder = "confirm email"
        
        passwordTxtField.translatesAutoresizingMaskIntoConstraints = false
        passwordTxtField.floatingLabelColor = .darkGreen
        passwordTxtField.placeholder = "password"
    }
    
    func addLayoutConstraints() {
        
        addSubview(loginDetailLbl)
        addSubview(emailTxtField)
        addSubview(usernameDescLabel)
        
        NSLayoutConstraint.activate([
        
            loginDetailLbl.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            loginDetailLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            loginDetailLbl.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -1),
            
            emailTxtField.topAnchor.constraint(equalTo: loginDetailLbl.bottomAnchor, constant: 30),
            emailTxtField.leadingAnchor.constraint(equalTo: loginDetailLbl.leadingAnchor),
            emailTxtField.trailingAnchor.constraint(equalTo: loginDetailLbl.trailingAnchor),
            
            usernameDescLabel.topAnchor.constraint(equalToSystemSpacingBelow: emailTxtField.bottomAnchor, multiplier: 1),
            usernameDescLabel.leadingAnchor.constraint(equalTo: loginDetailLbl.leadingAnchor),
            usernameDescLabel.trailingAnchor.constraint(equalTo: loginDetailLbl.trailingAnchor),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: usernameDescLabel.bottomAnchor, multiplier: 1)
            
        ])
    }
}
