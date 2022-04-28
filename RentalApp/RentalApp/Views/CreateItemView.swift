//
//  CreateItemView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class CreateItemView : UIView {
    var titleTextField : UITextField!
    var descriptionTextField : UITextField!
    var imageButton : UIButton!
    var priceTextField : UITextField!
    var submitButton : UIButton!
    var backButton : UIButton!
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backButton = UIButton()
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageButton = UIButton()
        imageButton.setTitle("Choose a image", for: .normal)
        imageButton.setTitleColor(.black, for: .normal)
        addSubview(imageButton)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10).isActive = true
        imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleTextField = UITextField()
        titleTextField.textColor = .black
        titleTextField.placeholder = "Item title"
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleTextField.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 10).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        descriptionTextField = UITextField()
        descriptionTextField.textColor = .black
        descriptionTextField.placeholder = "Item description"
        addSubview(descriptionTextField)
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20).isActive = true
        descriptionTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        priceTextField = UITextField()
        priceTextField.textColor = .black
        priceTextField.placeholder = "Item price"
        addSubview(priceTextField)
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        priceTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20).isActive = true
        priceTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        submitButton = UIButton()
        submitButton.backgroundColor = .green
        submitButton.setTitle("Create Item", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        submitButton.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 20).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

