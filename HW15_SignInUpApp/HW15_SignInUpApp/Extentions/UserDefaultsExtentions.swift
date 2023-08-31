//
//  UserDefaultsExtentions.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 31.08.23.
//

import Foundation

extension UserDefaults {
    enum Keys: String, CaseIterable {
        case email
        case name
        case password
    }
    
    func resert() {
        let allCases = Keys.allCases
        allCases.forEach {
            removeObject(forKey: $0.rawValue)
        }
    }
}
