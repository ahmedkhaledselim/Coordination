//
//  StoryboardName.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import Foundation

enum StoryboardName: String {
  case login
  case home
  
  var fileName: String {
    return self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
  }
}
