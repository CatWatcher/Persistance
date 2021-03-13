//
//  UDclass.swift
//  Lesson 14
//
//  Created by Феликс Фимберг on 12.03.2021.
//

import Foundation

enum Keys: String {
    case nameKey
    case surnameKey
}

class UDclass {
    
    static let shared = UDclass()
    
    let defaults = UserDefaults.standard
    
    var name: String? {
        set { defaults.setValue(newValue, forKey: Keys.nameKey.rawValue)
        }
        get { return defaults.string(forKey: Keys.nameKey.rawValue) }
    }
    
    var surname: String? {
        set { defaults.setValue(newValue, forKey: Keys.surnameKey.rawValue) }
        get { defaults.string(forKey: Keys.surnameKey.rawValue) }
    }
    
}
