//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 阿福 on 27/02/2025.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
