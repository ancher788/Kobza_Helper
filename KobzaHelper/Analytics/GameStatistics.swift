//
//  GameStatistics.swift
//  KobzaHelper
//
//  Created by Anatolii Chernetskyi on 20.12.2023.
//

import Foundation

class GameStatistics {
    
    static var numberOfGames: Int {
        get { UserDefaults.standard.integer(forKey: UserDefaultsKeys.numberOfGames) }
        set { UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.numberOfGames) }
    }
    
    static var numberOfSuccessTries: Int {
        get { UserDefaults.standard.integer(forKey: UserDefaultsKeys.numberOfSuccessTries) }
        set { UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.numberOfSuccessTries) }
    }
    
    static var numberOfUnsuccessTries: Int {
        get { UserDefaults.standard.integer(forKey: UserDefaultsKeys.numberOfUnsuccessTries) }
        set { UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.numberOfUnsuccessTries) }
    }
    
    static func incrementNumberOfTriesToWin(forCount count: Int) {
        guard (1...6).contains(count) else {
            print("Count must be between 1 and 6.")
            return
        }
        
        let key = UserDefaultsKeys.numberOfTriesToWinKey(forCount: count)
        let currentCount = UserDefaults.standard.integer(forKey: key)
        UserDefaults.standard.set(currentCount + 1, forKey: key)
    }
    
    static func countForNumberOfTriesToWin(forCount count: Int) -> Int {
        let key = UserDefaultsKeys.numberOfTriesToWinKey(forCount: count)
        return UserDefaults.standard.integer(forKey: key)
    }
}
