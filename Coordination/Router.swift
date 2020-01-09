//
//  Router.swift
//  MarketMap
//
//  Created by Ahmed Khaled on 1/3/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit

final public class Router: NSObject, RouterType {
  
  private let navigationController: UINavigationController
  private var completions: [UIViewController : () -> Void]
  
  public init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    completions = [:]
    super.init()
    self.navigationController.delegate = self
  }
  
  public func present(_ module: Presentable, animated: Bool, completion: (() -> Void)? = nil) {
    navigationController.present(module.toPresentable(), animated: animated, completion: completion)
  }
  
  public func push(_ module: Presentable, animated: Bool, hideBottomBar: Bool = false, onPop: (() -> Void)?) {
    let controller = module.toPresentable()
    
    // Avoid pushing UINavigationController onto stack
    guard controller is UINavigationController == false else {
      return
    }
    if let onPop = onPop {
      completions[controller] = onPop
    }
    controller.hidesBottomBarWhenPushed = hideBottomBar
    navigationController.pushViewController(controller, animated: animated)
  }
  
  public func popModule(animated: Bool) {
    if let controller = navigationController.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }
  
  public func dismissModule(animated: Bool, completion: (() -> Void)? = nil) {
    navigationController.dismiss(animated: animated, completion: completion)
  }
  
  public func setRootModule(_ module: Presentable, hideBar: Bool = false, onPop: (() -> Void)? = nil) {
    let controller = module.toPresentable()
    
    // Avoid pushing UINavigationController onto stack
    guard controller is UINavigationController == false else {
      return
    }
    // Call all completions so all coordinators can be deallocated
    completions.forEach { runCompletion(for: $0.key) }
    if let onPop = onPop {
      completions[controller] = onPop
    }
    navigationController.setViewControllers([module.toPresentable()], animated: false)
    navigationController.isNavigationBarHidden = hideBar
  }
  
  public func popToRootModule(animated: Bool) {
    if let controllers = navigationController.popToRootViewController(animated: animated) {
      controllers.forEach { runCompletion(for: $0) }
    }
  }
  
  private func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
  
  // MARK: Presentable
  public func toPresentable() -> UIViewController {
    return navigationController
  }
}

// MARK: UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
  
  public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    
    // Ensure the view controller is popping
    guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
      !navigationController.viewControllers.contains(poppedViewController) else {
        return
    }
    
    runCompletion(for: poppedViewController)
  }
}
