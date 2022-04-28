//
//  ItemViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

//Controller that handles logic for the Individual item views such as renting the item.
class ItemViewController : UIViewController {
    var itemView : ItemView!
    var rentView : RentView!
    var item : Item!
    var user : User!
    var parentVC : ItemListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        itemView = ItemView(item: item) //Init ItemView
        itemView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        itemView.rentButton.addTarget(self, action: #selector(goToRentView), for: .touchUpInside)
        view.addSubview(itemView)
        itemView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true //Used Auto Layout constraints for the sizing and placement of views.
        itemView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        itemView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        itemView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func goToRentView() {
        rentView = RentView(item: item)
        rentView.backButton.addTarget(self, action: #selector(rentViewBackAction), for: .touchUpInside)
        rentView.rentButton.addTarget(self, action: #selector(rentAction), for: .touchUpInside)
        view.addSubview(rentView)
        rentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        rentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func rentViewBackAction() {
        rentView.removeFromSuperview()
        rentView = nil
    }
    
    @objc func rentAction() {
        let pickupTime = rentView.pickupDateTimePicker.date.timeIntervalSince1970
        let dropOffTime = rentView.dropOffDateTimePicker.date.timeIntervalSince1970
        
        let params : [String : Any] = [
            "pickupTime" : pickupTime,
            "dropOffTime" : dropOffTime,
            "itemId" : String(item.id),
            "buyerId" : String(user.id)
        ]
        
        ApiRequest.getInstance().sendPost(url: "rent-item", parameters: params, finished: {(result) -> Void in //Using the ApiRequest singleton to send a post request to the "/rent-item" api endpoint
            if result.contains("@") {
                let alert = UIAlertController(title: "Success!", message: "You successfully rented this item!\nPlease coordinate with " + result + " on picking up and dropping off the item.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                    DispatchQueue.main.async {
                        self.backAction()
                    }
                }))
                DispatchQueue.main.async {
                    self.present(alert, animated: false, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error!", message: result, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                    DispatchQueue.main.async {
                        self.backAction()
                    }
                }))
                DispatchQueue.main.async {
                    self.present(alert, animated: false, completion: nil)
                }
            }
        })
    }
    
    @objc func backAction() {
        parentVC.reloadData()
        self.dismiss(animated: false, completion: nil)
    }
}
