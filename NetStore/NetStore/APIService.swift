//
//  APIService.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import Foundation

actor APIService {
    static let shared = APIService()
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([User].self, from: data)
    }
}
