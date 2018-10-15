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
    
    
    func getAllInfo(location: Location, complition: @escaping ( _ times: Soruce)->()) {
        var baseURL = "https://api.sunrise-sunset.org/json?lat=" + location.latitude + "&lng=" + location.longitude + "&date=today"
        baseURL = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=today"
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
                print(times)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
    }
}


