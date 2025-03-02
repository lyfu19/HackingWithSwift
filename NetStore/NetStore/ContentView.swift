//
//  ContentView.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var UserVM = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(UserVM.users) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.name)
                                .font(.headline)
                            HStack {
                                Text("Active:")
                                Text("\(user.isActive)")
                                    .foregroundStyle(user.isActive ? .green : .red)
                            }
                            .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("User List")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
        }
        .task {
            await UserVM.loadUsers()
        }
    }
}

#Preview {
    ContentView()
}
