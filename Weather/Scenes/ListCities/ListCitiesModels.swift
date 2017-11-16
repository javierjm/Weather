//
//  ListCitiesModels.swift
//  Weather
//
//  Created by Javier Jara on 11/15/17.
//  Copyright (c) 2017 jjsoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ListCities {
  // MARK: Use cases
  
  enum FetchCities {
    struct Request{
        
    }
    struct Response{
        var cities: [City]
    }
    
    struct ViewModel {
        struct DisplayedCity {
            var cityId: String
            var name: String
            var temperature: String
        }
        var displayedCities: [DisplayedCity]
        var lastUpdate: String
    }
  }
}

struct City {
    var cityId: String
    var name: String
    var main: Main
    var weather: Weather
    var wind: Wind
    
    init(dictionary: [String: Any]){
        self.cityId = dictionary["id"] as? String ?? ""
        self.name = dictionary["temp"] as? String ?? ""
        self.main = Main(dictionary: dictionary["main"] as? Dictionary ?? [:])
        self.wind = Wind(dictionary: dictionary["wind"] as? Dictionary ?? [:])
        self.weather = Weather(dictionary: dictionary["weather"] as? Dictionary ?? [:])
    }
}

struct Main{
    var temp: String
    var humdity: String
    
    init(dictionary: [String: Any]){
        self.temp = dictionary["temp"] as? String ?? ""
        self.humdity = dictionary["humdity"] as? String ?? ""

    }
}

struct Weather {
    var weatherDescription: String
    
    init(dictionary: [String: Any]){
        self.weatherDescription = dictionary["weatherDescription"] as? String ?? ""
    }
}

struct Wind {
    var speed: String
    
    init(dictionary: [String : Any]){
        self.speed = dictionary["speed"] as? String ?? ""
    }
}
