//
//  AppDelegate.swift
//  HomeWorkApp
//
//  Created by Admin on 09.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NavigationViewController()
        window?.makeKeyAndVisible()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        let color = getColorStyle(style: .magenta)
        
        UINavigationBar.appearance().tintColor = color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().prefersLargeTitles = true
        
        UITabBar.appearance().tintColor = color
        
        DispatchQueue.main.async { for _ in 0...6 { NetworkService.dataTask(config: AppConfiguration.randomModelsExample1()) } }
        
        return true
    }

}

