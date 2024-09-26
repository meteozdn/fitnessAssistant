//
//  SharedPreferenceManager.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 20.09.2024.
//

import Foundation

class SharedPreferenceManager: NSObject{
    static let instance = SharedPreferenceManager()
    let sharedPreference = UserDefaults.standard
    
    func clearAllPreference(){
        if let bundle = Bundle.main.bundleIdentifier {
            sharedPreference.removePersistentDomain(forName: bundle)
        }
    }
    
    func saveUserCredential(_ userID: Int){
        sharedPreference.setValue(userID, forKey: "UserID")
        print(userID)
    }
    
    func getUserCredential() -> Int?{
        return sharedPreference.value(forKey: "UserID") as? Int
    }
}
