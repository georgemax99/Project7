//
//  ApiRequest.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation

//Tutorial source: https://stackoverflow.com/questions/26364914/http-request-in-swift-with-post-method

class ApiRequest { //Singleton class that is statically called to get an instance and use its methods to either send a get or post request.
    
    let endPoint = "http://rentalapp-env.eba-kxcmjxj4.us-east-1.elasticbeanstalk.com/"
    
    static var apiRequest : ApiRequest!//Singleton pattern
    
    static func getInstance() -> ApiRequest {
        if let apiRequest = apiRequest {
            return apiRequest
        } else {
            return ApiRequest()
        }
    }
    
    func sendPost(url : String, parameters : [String : Any], finished: @escaping (String) -> Void) {
        let url = URL(string: endPoint+url)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    finished(responseString)
                }
                
            }
            
        }
        
        task.resume()
    }
    
    func sendGet(url : String, parameters : [String : Any], finished: @escaping (String) -> Void) {
        var components = URLComponents(string: endPoint + url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        let url = components.url!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        //request.httpBody = parameters.percentEscaped().data(using: .utf8)
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    finished(responseString)
                }
                
            }
            
        }
        
        task.resume()
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
