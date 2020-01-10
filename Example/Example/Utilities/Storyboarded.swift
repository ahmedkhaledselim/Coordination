//
//  Storyboarded.swift
//  Example
//
//  Created by Ahmed Khaled on 1/9/20.
//  Copyright © 2020 Ahmed Khaled. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName: StoryboardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.fileName, bundle: Bundle(for: self.self))
        let vc = storyboard.instantiateViewController(withIdentifier: id) as! Self
        return vc
    }
}

extension UIViewController: Storyboarded {}
