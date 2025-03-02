//
//  UserViewModel.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import Foundation
import SwiftData

@Observable
class UserViewModel {
    var users = [User]()
    private var modelContext: ModelContext?
    
    func setModelContext(_ modelContext: ModelContext) {
        if self.modelContext == nil {
            self.modelContext = modelContext
        }
    }
    
    func loadUsers() async {
        let descriptor = FetchDescriptor<User>()
        if let cachedUsers = try? modelContext?.fetch(descriptor), !cachedUsers.isEmpty {
            users = cachedUsers
            print("Load from cache")
            return
        }
        
        do {
            users = try await APIService.shared.fetchUsers()
            
            try modelContext?.delete(model: User.self)
            users.forEach { modelContext?.insert($0) }
            try modelContext?.save()
            print("Load from internet")
        } catch {
            print("Error fetching users: \(error)")
        }
    }
}
