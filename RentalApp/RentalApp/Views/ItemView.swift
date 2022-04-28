//
//  ItemView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class ItemView : UIView {
    var backButton : UIButton!
    var imageView : UIImageView!
    var titleLabel : UILabel!
    var descriptionTextView : UITextView!
    var priceLabel : UILabel!
    var rentButton : UIButton!
    
    init(item : Item) {
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
        
        titleLabel = UILabel()
        titleLabel.text = item.title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Times New Roman Bold", size: 24)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        imageView = UIImageView()
        imageView.backgroundColor = .gray
        if (item.imgUrl != "NA") {
            URLSession.shared.dataTask(with: URL(string: "https://s3.us-east-2.amazonaws.com/superimagesbucket/"+item.imgUrl+".jpeg")!, completionHandler: { data, response, error in
                print("DOWNLOADING IMAGE")
                
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    self.imageView.image = UIImage(data: data)
                    //self.marketTableView.reloadData()
                }
                
            }).resume()
        }
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        priceLabel = UILabel()
        priceLabel.text = "Price: $" + String(item.price)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont(name: "Times New Roman", size: 24)
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        descriptionTextView = UITextView()
        descriptionTextView.text = item.description
        descriptionTextView.textColor = .black
        descriptionTextView.isEditable = false
        descriptionTextView.font = UIFont(name: "Times New Roman", size: 18)
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        descriptionTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        rentButton = UIButton()
        rentButton.setTitle("Rent", for: .normal)
        rentButton.setTitleColor(.black, for: .normal)
        rentButton.backgroundColor = .green
        addSubview(rentButton)
        rentButton.translatesAutoresizingMaskIntoConstraints = false
        rentButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10).isActive = true
        rentButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rentButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rentButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
