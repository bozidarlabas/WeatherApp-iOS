//
//  WeatherFetcher.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherFetcher {
    static func fetch(response: [City]? -> ()) {
        Alamofire.request(.GET, OpenWeatherMap.url, parameters: OpenWeatherMap.parameters)
            .response { _, _, data, _ in
                let cities = data.map { decode($0) }
                response(cities)
        }
    }
    
    private static func decode(data: NSData) -> [City] {
        let json = JSON(data: data)
        var cities = [City]()
        for (_, j) in json["list"] {
            if let id = j["id"].int {
                let city = City(
                    id: id,
                    name: j["name"].string ?? "",
                    weather: j["weather"][0]["main"].string ?? "")
                cities.append(city)
            }
        }
        return cities
    }
}