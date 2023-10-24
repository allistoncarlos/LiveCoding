//
//  UserDataSource.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import Foundation

class UserDataSource {
    func fetchUsers() async -> [User]? {
        do {
            let apiUrl = URL(string: "https://jserver-api.herokuapp.com/users")!

            let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        }
        catch {
            print("Erro: \(error)")
            
            return nil
        }
    }
}
