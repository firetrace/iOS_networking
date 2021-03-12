//
//  AppConfiguration.swift
//  MyHabits
//
//  Created by Александр Глазков on 11.03.2021.
//

import Foundation

enum AppConfiguration {
    
    case people(String)
    case starchips(String)
    case planets(String)
    
    static func random() -> AppConfiguration {
        
        var generator = SystemRandomNumberGenerator()
        
        let index = Int.random(in: 1...3, using: &generator)
        let id = Int.random(in: 1...100, using: &generator)
        
        switch index {
        case 1:
            return AppConfiguration.people("https://swapi.dev/api/people/\(id)")
        case 2:
            return AppConfiguration.starchips("https://swapi.dev/api/starships/\(id)")
        case 3:
            return AppConfiguration.planets("https://swapi.dev/api/planets/\(id)")
        default:
            return AppConfiguration.people("https://swapi.dev/api/people/\(id)")
        }
    }
}
