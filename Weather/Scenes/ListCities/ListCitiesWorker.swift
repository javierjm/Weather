
import UIKit

// MARK: Protocol Declaration

protocol CitiesStoreProtocol {
    func fetchCities(lat: String, lon:String, completionHandler: @escaping CitiesStoreFetchCitiesCompletionHandler)
    //func fetchCities(completionHandler: CitiesStoreResult<[Any]>)
    func fetchCity(id: String, completionHandler: @escaping CitiesStoreFetchCityCompletionHandler)
}

typealias CitiesStoreFetchCitiesCompletionHandler = (CitiesStoreResult<[City]>) -> Void
typealias CitiesStoreFetchCityCompletionHandler = (CitiesStoreResult<City>) -> Void

enum CitiesStoreResult<U> {
    case Success(result: U)
    case Failure(error: CitiesStoreError)
}

enum CitiesStoreError: Equatable, Error {
    case CannotFetch(String)
    case CannotCreate(String)
}

func ==(lhs: CitiesStoreError, rhs: CitiesStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    default: return false
    }
}

// MARK: Class Implementation
class ListCitiesWorker {
    // MARK: - Business Logic
    var citiesStore: CitiesStoreProtocol
    
    init(citiesStore: CitiesStoreProtocol) {
        self.citiesStore = citiesStore
    }
    
    func doSomeWork() {
        // NOTE: Do the work
    }
    
    //fetchCities{(completionHandler: CitiesStoreFetchCitiesCompletionHandler) in
    func fetchCities(lat: String, lon: String, completionHandler: @escaping (CitiesStoreFetchCitiesCompletionHandler)) {
        citiesStore.fetchCities(lat: lat, lon: lon) { (results: CitiesStoreResult<[City]>) in

            completionHandler(results)
        }
    }
}

