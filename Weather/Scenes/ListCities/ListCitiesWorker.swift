
import UIKit

// MARK: Protocol Declaration

protocol CitiesStoreProtocol {
    func fetchCities(lat: String, lon:String, completionHandler: @escaping CitiesStoreFetchCitiesCompletionHandler)
}

typealias CitiesStoreFetchCitiesCompletionHandler = (CitiesStoreResult<[City]>) -> Void

enum CitiesStoreResult<U> {
    case Success(result: U)
    case Failure(error: CitiesStoreError)
}

enum CitiesStoreError: Equatable, Error {
    case CannotFetch(String)
    case CannotFindLocation(String)
}

func ==(lhs: CitiesStoreError, rhs: CitiesStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
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
    
    func fetchCities(lat: String, lon: String, completionHandler: @escaping (CitiesStoreFetchCitiesCompletionHandler)) {
        citiesStore.fetchCities(lat: lat, lon: lon) { (results: CitiesStoreResult<[City]>) in
            completionHandler(results)
        }
    }
}

