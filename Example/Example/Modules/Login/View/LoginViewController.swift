//
//  LoginViewController.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  var coordinator: LoginCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Login"
  }
  @IBAction func loginButton_TouchUpInside(_ sender: UIButton) {
    coordinator?.parentCoordinator?.runHomeFlow()
  }
}
