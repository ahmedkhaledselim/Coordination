//
//  Presentable.swift
//  MarketMap
//
//  Created by Ahmed Khaled on 1/3/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit

public protocol Presentable {
  func toPresentable() -> UIViewController
}

extension UIViewController: Presentable {
  public func toPresentable() -> UIViewController {
    return self
  }
}
