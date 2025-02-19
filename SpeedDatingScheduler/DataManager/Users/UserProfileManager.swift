//
//  UserProfileManager.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import Foundation

protocol UserProfileManagerType {
    func getUsers(count: Int)
}

class UserProfileManager {
    func getUsers(count: Int) {
        guard let url = URL(string: "https://randomuser.me/api/1.4/?format=json&results=\(count)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                error == nil,
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any],
                let resultsJson = json["results"] as? [String: Any]
            else { return }
            
            // didn't get around to creating all of the models necessary to decode this easily
            print(resultsJson)
            
        }.resume()
    }
}
