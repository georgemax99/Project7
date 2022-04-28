//
//  TitleView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

//View from MVC

class TitleView : UIView {
    var loginButton : UIButton!
    var signupButton : UIButton!
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        loginButton = UIButton()
        loginButton.backgroundColor = .green
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loginButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        signupButton = UIButton()
        signupButton.backgroundColor = .green
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(.black, for: .normal)
        addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
