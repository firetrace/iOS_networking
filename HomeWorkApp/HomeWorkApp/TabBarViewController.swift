//
//  TabBarViewController.swift
//  HomeWorkApp
//
//  Created by Admin on 09.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        let infoViewController = InfoViewController()
        
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        
        viewControllers = [infoViewController]
    }
}
