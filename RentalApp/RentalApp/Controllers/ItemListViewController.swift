//
//  ItemListViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class ItemListViewController : UIViewController {
    var itemListView : ItemListView!
    var user : User!
    var itemList : [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiRequest.getInstance().sendGet(url: "get-items", parameters: [:], finished: {(result) -> Void in
            print(result)
            self.itemList = Item().getItems(json: result)
            DispatchQueue.main.async {
                self.initUI()
            }
        })
        
        initUI()
    }
    
    func initUI() {
        itemListView = ItemListView(items: itemList, parentVC: self)
        itemListView.createItemButton.addTarget(self, action: #selector(switchToCreateItem), for: .touchUpInside)
        view.addSubview(itemListView)
        itemListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        itemListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        itemListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        itemListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    @objc func switchToCreateItem() {
        let vc = CreateItemViewController()
        vc.user = user
        vc.modalPresentationStyle = .fullScreen
        vc.parentVC = self
        present(vc, animated: false, completion: nil)
    }
    
    func reloadData() {
        ApiRequest.getInstance().sendGet(url: "get-items", parameters: [:], finished: {(result) -> Void in
            print(result)
            self.itemList = Item().getItems(json: result)
            DispatchQueue.main.async {
                self.itemListView.items = self.itemList
                self.itemListView.tableView.reloadData()
            }
        })
    }
}
