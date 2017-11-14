//
//  ListCitiesConfigurator.swift
//  Weather
//
//  Created by Javier Jara on 11/14/17.
//  Copyright (c) 2017 jjsoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ListCitiesConfiguratorViewController: ListCitiesConfiguratorPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension ListCitiesConfiguratorInteractor: ListCitiesConfiguratorViewControllerOutput
{
}

extension ListCitiesConfiguratorPresenter: ListCitiesConfiguratorInteractorOutput
{
}

class ListCitiesConfiguratorConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = ListCitiesConfiguratorConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: ListCitiesConfiguratorViewController)
  {
    let router = ListCitiesConfiguratorRouter()
    router.viewController = viewController
    
    let presenter = ListCitiesConfiguratorPresenter()
    presenter.output = viewController
    
    let interactor = ListCitiesConfiguratorInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
