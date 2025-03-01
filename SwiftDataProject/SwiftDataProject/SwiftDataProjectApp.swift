//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by 阿福 on 01/03/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
