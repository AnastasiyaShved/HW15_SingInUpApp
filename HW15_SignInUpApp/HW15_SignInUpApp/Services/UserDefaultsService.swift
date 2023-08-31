//
//  UserDefultsService.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 31.08.23.
//

import Foundation

final class UserDefaultsService {
    static func  saveUserMidel(userModel: UserModel) {
        UserDefaults.standard.setValue(userModel.name, forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.setValue(userModel.name, forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.setValue(userModel.name, forKey: UserDefaults.Keys.password.rawValue)
    }
     
    static func  getUserMidel() -> UserModel? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        
        guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let pass = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue) else
        {
            return nil
        }
        let userModel = UserModel(name: name, email: email, pass: pass)
            return userModel
    }
    static func cleanUserDefoult() {
        UserDefaults.standard.resert()
    }
}
