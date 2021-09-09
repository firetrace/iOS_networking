//
//  NavigationViewController.swift
//  HomeWorkApp
//
//  Created by Admin on 09.09.2021.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init() {
        self.init(rootViewController: TabBarViewController())
    }
}
