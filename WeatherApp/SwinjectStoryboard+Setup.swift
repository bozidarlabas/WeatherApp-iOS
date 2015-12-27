//
//  SwinjectStoryboard+Setup.swift
//  WeatherApp
//
//  Created by Bozidar on 27.12.2015..
//  Copyright © 2015. Bozidar. All rights reserved.
//

import Swinject

extension SwinjectStoryboard {
    class func setup() {
        //c is instance of registerForStoryboard
        //r is instance of resolver which resolve instances
        defaultContainer.registerForStoryboard(WeatherTableViewController.self) { r, c in
            c.weatherFetcher = r.resolve(WeatherFetcher.self)
        }
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
    }
}