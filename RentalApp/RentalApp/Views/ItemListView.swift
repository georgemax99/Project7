//
//  ItemListView.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class ItemListView : UIView, UITableViewDataSource, UITableViewDelegate {
    var tableView : UITableView!
    var createItemButton : UIButton!
    
    var items : [Item]!
    
    var parentVC : ItemListViewController!
    
    init(items : [Item]!, parentVC : ItemListViewController) {
        super.init(frame: .zero)
        
        self.parentVC = parentVC
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.items = items
        
        createItemButton = UIButton()
        createItemButton.backgroundColor = .green
        createItemButton.setTitle("List a item", for: .normal)
        createItemButton.setTitleColor(.black, for: .normal)
        addSubview(createItemButton)
        createItemButton.translatesAutoresizingMaskIntoConstraints = false
        createItemButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        createItemButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        createItemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        createItemButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: createItemButton.topAnchor, constant: -10).isActive = true
        
        backgroundColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = items {
            return items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let items = items {
            let item = items[indexPath.row]
            cell.textLabel?.text = item.title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let items = items {
            let item = items[indexPath.row]
            switchToItemView(item: item)
        }
    }
    
    func switchToItemView(item : Item) {
        let vc = ItemViewController()
        vc.item = item
        vc.user = parentVC.user
        vc.parentVC = parentVC
        vc.modalPresentationStyle = .fullScreen
        parentVC.present(vc, animated: false, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
