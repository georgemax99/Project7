//
//  SignupView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class SignupView : UIView {
    var nameTextField : UITextField!
    var emailTextField : UITextField!
    var passwordTextField : UITextField!
    var submitButton : UIButton!
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField = UITextField()
        nameTextField.textColor = .black
        nameTextField.placeholder = "Your name"
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        emailTextField = UITextField()
        emailTextField.textColor = .black
        emailTextField.placeholder = "Your email"
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        passwordTextField = UITextField()
        passwordTextField.textColor = .black
        passwordTextField.placeholder = "Your password"
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        submitButton = UIButton()
        submitButton.backgroundColor = .green
        submitButton.setTitle("Sign Up!", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

