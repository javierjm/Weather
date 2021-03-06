//
//  ShowCityModels.swift
//  Weather
//
//  Created by Javier Jara on 11/16/17.
//  Copyright (c) 2017 jjsoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ShowCity {
    // MARK: Use cases
    
    enum GetCity {
        struct Request {
        }
        
        struct Response {
            var city: City
        }
        
        struct ViewModel {
            struct DisplayedCity {
                var id: String
                var name: String
                var country: String
                var weatherDescription: String
                var temp: String
                var tempMin: String
                var tempMax: String
                var humidity: String
                var atm: String
                var windSpeed: String
                var imageName: String
            }
            
            var displayedCity: DisplayedCity
        }
    }
}
