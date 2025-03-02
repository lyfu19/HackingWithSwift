//
//  DetailView.swift
//  NetStore
//
//  Created by 阿福 on 02/03/2025.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        List {
            Section {
                Text("Name: \(user.name)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
            } header: {
                Text("Detail Information")
            }
            
            Section {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
            } header: {
                Text("Tags")
            }
            
            Section {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 40)], spacing: 8) {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                            .fixedSize()
                            .padding(8)
                            .background(.blue.opacity(0.2))
                    }
                }
            } header: {
                Text("Friends")
            }
            
            
            Section {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 0) {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
//                            .fixedSize()
                            .padding(8)
                            .background(.blue.opacity(0.2))
                    }
                }
            } header: {
                Text("Friends")
            }
        }
    }
}

