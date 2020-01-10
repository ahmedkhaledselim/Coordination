//
//  LoginCoordinator.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit
import Coordination

class LoginCoordinator: Coordinator {
  
  var router: RouterType
  var childCoordinators: [Coordinator] = []
  var parentCoordinator: ApplicationCoordinator?
  let viewcontroller = LoginViewController.instantiate(storyboardName: .login)
  
  init(router: RouterType) {
    self.router = router
  }
  
  func toPresentable() -> UIViewController {
    viewcontroller.coordinator = self
    return viewcontroller
  }
}
