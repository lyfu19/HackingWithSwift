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

#Preview {
    DetailView(user: User(id: "01eec130-b2e6-4da1-91e1-0bf85fe4a8d6", isActive: false, name: "Miriam Lloyd", age: 31, company: "Eyewax", email: "miriamlloyd@eyewax.com", address: "636 Diamond Street, Chumuckla, Massachusetts, 6191", about: "Ullamco non ut consequat anim officia laborum dolore Lorem ut proident adipisicing qui eu. Consectetur aute officia Lorem est magna sunt cupidatat magna quis laborum. Nostrud aliquip nisi duis velit elit ea labore labore qui ullamco veniam. Esse eiusmod aliquip magna magna culpa quis veniam do incididunt. Dolor ut aliquip magna consectetur aliqua cillum sunt incididunt id.", registered: .now, tags: [
        "sit",
        "dolor",
        "tempor",
        "elit",
        "nisi",
        "incididunt",
        "veniam"
    ], friends: [User.Friend(id: "8d90-4d2b-a6c7-0303f673ef2b", name: "Boyer Nieves"),
                 User.Friend(id: "fc81-4858-985e-8e7b5a12c2a9", name: "Osborn Moss")
                ]))
}
