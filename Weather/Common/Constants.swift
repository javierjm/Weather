
import Foundation

enum Constants {
    enum Endpoint {
        static let openWeatherKey = "038b1a82502061ad27da6f5f88f7aee5"
        static let citiesURL = "http://api.openweathermap.org/data/2.5/find?cnt=10&appid=\(openWeatherKey)"
    }
}
