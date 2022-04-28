//
//  Item.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation

//Model from MVC

class Item : Codable {
    var id : Int64!
    var title : String!
    var description : String!
    var price : Double!
    var imgUrl : String!
    
    func getItems(json : String) -> [Item]? {
        let jsonData = Data(json.utf8)
        
        let decoder = JSONDecoder()
        
        do {
            let itemList = try decoder.decode([Item].self, from: jsonData)
            return itemList
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
        
    }
}
