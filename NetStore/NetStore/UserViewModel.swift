//
//  UserViewModel.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import Foundation

@Observable
class UserViewModel {
    var users = [User]()
    
    func loadUsers() async {
        do {
            users = try await APIService.shared.fetchUsers()
        } catch {
            print("Error fetching users: \(error)")
        }
    }
}
