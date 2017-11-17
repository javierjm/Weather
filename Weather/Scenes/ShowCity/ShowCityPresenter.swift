//
//  ShowCityPresenter.swift
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

protocol ShowCityPresentationLogic {
  func presentCity(response: ShowCity.GetCity.Response)
}

class ShowCityPresenter: ShowCityPresentationLogic {
  weak var viewController: ShowCityDisplayLogic?
  
  // MARK: present City
  
  func presentCity(response: ShowCity.GetCity.Response) {
    let city = response.city
    let displayedCity = ShowCity.GetCity.ViewModel.DisplayedCity(id: city.cityId,
                                                                 name: city.name,
                                                                 country: city.sys.country,
                                                                 weatherDescription: city.weather?.weatherDescription ?? "",
                                                                 temp: "\(city.main.temp)°",
                                                                 tempMin: "\(city.main.tempMin)°",
                                                                 tempMax: "\(city.main.tempMax)°",
                                                                 humidity: "\(city.main.humdity)%",
                                                                 atm: city.main.atm,
                                                                 windSpeed: city.wind.speed,
                                                                 imageName: city.iconImageNameForCode())
    // city?.iconImageNameForCode()
    
    let viewModel = ShowCity.GetCity.ViewModel(displayedCity: displayedCity)
    viewController?.displayCity(viewModel: viewModel)
  }
}