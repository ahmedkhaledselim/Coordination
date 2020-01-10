//
//  ApplicationCoordinator.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit
import Coordination

class ApplicationCoordinator: Coordinator {
  let window: UIWindow
  var router: RouterType
  var childCoordinators: [Coordinator] = []
  
  init(window: UIWindow) {
    router = Router()
    self.window = window
    window.rootViewController = router.toPresentable()
    window.makeKeyAndVisible()
  }
  
  func start() {
    runAuthenticationFlow()
  }
  
  func runAuthenticationFlow() {
    let loginCoordinator = LoginCoordinator(router: router)
    router.setRootModule(loginCoordinator) {
      self.removeChild(loginCoordinator)
    }
    loginCoordinator.parentCoordinator = self
    addChild(loginCoordinator)
  }
  
  func runHomeFlow() {
    let homeCoordinator = HomeCoordinator(router: router)
    router.setRootModule(homeCoordinator) {
      self.removeChild(homeCoordinator)
    }
    homeCoordinator.parentCoordinator = self
    addChild(homeCoordinator)
  }
}
