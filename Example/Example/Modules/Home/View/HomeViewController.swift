//
//  HomeViewController.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var coordinator: HomeCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Home"
  }
  @IBAction func loginButton_TouchUpInside(_ sender: UIButton) {
    coordinator?.parentCoordinator?.runAuthenticationFlow()
  }
}
