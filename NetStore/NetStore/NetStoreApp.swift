//
//  NetStoreApp.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import SwiftUI
import SwiftData

@main
struct NetStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
