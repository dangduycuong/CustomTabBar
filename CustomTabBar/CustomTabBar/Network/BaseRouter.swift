//
//  BaseRouter.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import Foundation
import UIKit


class BaseRouter {
    static let shared: BaseRouter = BaseRouter()
    
    func callAPI<T: Codable>(url: URL?, completion: @escaping(T) -> Void) {
        guard url != nil else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("fullURLRequest: ", url as Any)
                print("params: ", url?.query as Any)
                print("header: ", url?.relativeString as Any)
                print("Response json:\n", dataString)
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data!)
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch { print(error)}
        }
        dataTask.resume()
    }
    

}


extension URL {
    
    func appendingParams(_ queryItem: String, value: String?) -> URL {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Returns the url from new url components
        return urlComponents.url!
    }
}
