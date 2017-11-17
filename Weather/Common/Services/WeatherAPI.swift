// Native
import Foundation

// Pods
import Alamofire

class WeatherAPI: CitiesStoreProtocol
{

    // MARK: - CRUD operations - Generic enum result type
    func fetchCities(lat: String, lon: String, completionHandler: @escaping CitiesStoreFetchCitiesCompletionHandler) {
        let urlString = "\(Constants.Endpoint.citiesURL)&lat=\(lat)&lon=\(lon)"
        Alamofire.request(urlString).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                guard let value = response.result.value as? [String: Any],
                    let rows = value["list"] as? [[String: Any]] else {
                        let error = "Malformed data received from fetchCities service"
                        completionHandler(CitiesStoreResult.Failure( error: .CannotFetch(error)))
                        return
                }
                let cities = rows.map{ City(dictionary: $0) }
                completionHandler(CitiesStoreResult.Success(result:cities))
            case .failure(let error):
                completionHandler(CitiesStoreResult.Failure(error: .CannotFetch(error.localizedDescription)))
            }
        }
    }
}
