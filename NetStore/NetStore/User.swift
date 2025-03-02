//
//  Person.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    struct Friend: Codable, Hashable {
        let id: String
        let name: String
    }
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: Array<String>
    let friends: Array<Friend>
}
