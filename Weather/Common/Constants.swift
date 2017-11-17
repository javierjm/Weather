
import Foundation
import UIKit

enum Constants {
    enum Endpoint {
        static let openWeatherKey = "038b1a82502061ad27da6f5f88f7aee5"
        static let citiesURL = "https://api.openweathermap.org/data/2.5/find?cnt=10&appid=\(openWeatherKey)&units=metric"
    }
    enum Colors {
        static let applicationLightBlue = UIColor(red: 11/255, green: 121/255, blue: 217/255, alpha: 1.0)
    }
    enum Fonts {
        static let applicationRegularArvo = "Arvo"
    }
    
    enum Images {
        static let nonConnection = "check_connection"
    }
}
