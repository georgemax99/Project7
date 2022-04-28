//
//  User.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation

class User : Codable {
    var id : Int64!
    var name : String!
    var email : String!
    
    func saveUser(json: String) -> User? {
        let jsonData = Data(json.utf8)
        
        UserDefaults.standard.set(jsonData, forKey: "User")
        
        let decoder = JSONDecoder()
        
        do {
            let user = try decoder.decode(User.self, from: jsonData)
            return user
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func getUser(jsonData: Data) -> User? {
        let decoder = JSONDecoder()
        
        do {
            let user = try decoder.decode(User.self, from: jsonData)
            return user
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
