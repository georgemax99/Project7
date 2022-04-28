//
//  RentView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class RentView : UIView {
    var pickupDateTimePicker : UIDatePicker!
    var dropOffDateTimePicker : UIDatePicker!
    var backButton : UIButton!
    var rentButton : UIButton!
    
    var item : Item!
    
    init(item : Item) {
        super.init(frame: .zero)
        self.item = item
        initUI()
    }
    
    func initUI() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        backButton = UIButton()
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let pickupLabel = UILabel()
        pickupLabel.text = "Choose pickup date and time:"
        pickupLabel.textColor = .black
        addSubview(pickupLabel)
        pickupLabel.translatesAutoresizingMaskIntoConstraints = false
        pickupLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        pickupLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pickupLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pickupLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        pickupDateTimePicker = UIDatePicker()
        pickupDateTimePicker.minimumDate = Date()
        pickupDateTimePicker.preferredDatePickerStyle = .compact
        pickupDateTimePicker.datePickerMode = .dateAndTime
        pickupDateTimePicker.minuteInterval = 15
        pickupDateTimePicker.backgroundColor = .white
        pickupDateTimePicker.timeZone = .current
        addSubview(pickupDateTimePicker)
        pickupDateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        pickupDateTimePicker.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pickupDateTimePicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pickupDateTimePicker.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor).isActive = true
        
        let dropOffLabel = UILabel()
        dropOffLabel.text = "Choose drop off date and time:"
        dropOffLabel.textColor = .black
        addSubview(dropOffLabel)
        dropOffLabel.translatesAutoresizingMaskIntoConstraints = false
        dropOffLabel.topAnchor.constraint(equalTo: pickupDateTimePicker.bottomAnchor, constant: 10).isActive = true
        dropOffLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dropOffLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dropOffLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        dropOffDateTimePicker = UIDatePicker()
        dropOffDateTimePicker.minimumDate = Date()
        dropOffDateTimePicker.preferredDatePickerStyle = .compact
        dropOffDateTimePicker.datePickerMode = .dateAndTime
        dropOffDateTimePicker.minuteInterval = 15
        dropOffDateTimePicker.backgroundColor = .white
        dropOffDateTimePicker.timeZone = .current
        addSubview(dropOffDateTimePicker)
        dropOffDateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        dropOffDateTimePicker.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dropOffDateTimePicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dropOffDateTimePicker.topAnchor.constraint(equalTo: dropOffLabel.bottomAnchor).isActive = true
        
        rentButton = UIButton()
        rentButton.setTitle("Rent for $"+String(item.price)+"/day", for: .normal)
        rentButton.setTitleColor(.black, for: .normal)
        rentButton.backgroundColor = .green
        addSubview(rentButton)
        rentButton.translatesAutoresizingMaskIntoConstraints = false
        rentButton.topAnchor.constraint(equalTo: dropOffDateTimePicker.bottomAnchor, constant: 10).isActive = true
        rentButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rentButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rentButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
