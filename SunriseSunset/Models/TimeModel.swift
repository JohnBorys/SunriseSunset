//
//  TimeModel.swift
//  SunriseSunset
//
//  Created by Іван on 10/14/18.
//  Copyright © 2018 Ivan. All rights reserved.
//

import UIKit

struct TimeModel: Decodable {
    var sunrise: String
    var sunset: String
    var solar_noon: String
    var nautical_twilight_end: String
}
