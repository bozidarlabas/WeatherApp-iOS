//
//  Network.swift
//  WeatherApp
//
//  Created by Bozidar on 27.12.2015..
//  Copyright © 2015. Bozidar. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(response: NSData? -> ()) {
        Alamofire.request(.GET, OpenWeatherMap.url, parameters: OpenWeatherMap.parameters)
            .response { _, _, data, _ in
                response(data)
        }
    }
}