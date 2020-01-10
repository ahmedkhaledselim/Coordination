//
//  HomeCoordinator.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit
import Coordination

class HomeCoordinator: Coordinator {
  
  var router: RouterType
  var childCoordinators: [Coordinator] = []
  var parentCoordinator: ApplicationCoordinator?
  let viewController = HomeViewController.instantiate(storyboardName: .home)
  
  init(router: RouterType) {
    self.router = router
  }
  
  func logout() {
    parentCoordinator?.runAuthenticationFlow()
  }
  
  func toPresentable() -> UIViewController {
    viewController.coordinator = self
    return viewController
  }
}
