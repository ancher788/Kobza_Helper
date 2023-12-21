//
//  UserDefaultsKeys.swift
//  KobzaHelper
//
//  Created by Anatolii Chernetskyi on 20.12.2023.
//

import Foundation

struct UserDefaultsKeys {
    static let numberOfGames = "numberOfGames"
    static let numberOfSuccessTries = "numberOfSuccessTries"
    static let numberOfUnsuccessTries = "numberOfUnsuccessTries"
    static func numberOfTriesToWinKey(forCount count: Int) -> String {
        return "numberOfTriesToWin_\(count)"
    }
}
