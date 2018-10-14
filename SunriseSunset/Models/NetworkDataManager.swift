//
//  NetworkDataManager.swift
//  SunriseSunset
//
//  Created by Іван on 10/14/18.
//  Copyright © 2018 Ivan. All rights reserved.
//

import UIKit

class NetworkDataManager {
    static let sharedNetworkDataManager = NetworkDataManager()
    
    
    func getAllInfo(complition: @escaping (_ times: Soruce)->()) {
        
        let baseURL = "https://api.sunrise-sunset.org/json?lat=49.842&lng=24.0316&date=today"
        guard let url = URL(string: baseURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if err != nil {
                print("resieve error, \(err.debugDescription)")
            }
            
            guard let data = data else { return }
            
            do {
                let times = try JSONDecoder().decode(Soruce.self, from: data)
                
                complition(times)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
    }
}


