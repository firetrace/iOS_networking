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
        let infoTaskOneViewController = InfoViewController(task: Task.One)
        let infoTaskTwoViewController = InfoViewController(task: Task.Two)
        let infoTaskThreeViewController = InfoViewController(task: Task.Three)
        
        infoTaskOneViewController.tabBarItem = UITabBarItem(title: "Задание №1", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        infoTaskTwoViewController.tabBarItem = UITabBarItem(title: "Задание №2", image: UIImage(systemName: "info.circle.fill"), tag: 2)
        infoTaskThreeViewController.tabBarItem = UITabBarItem(title: "Задание №3", image: UIImage(systemName: "info.circle.fill"), tag: 3)
        
        viewControllers = [infoTaskOneViewController, infoTaskTwoViewController, infoTaskThreeViewController]
    }
}
