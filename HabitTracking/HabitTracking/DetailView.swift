//
//  DetailView.swift
//  HabitTracking
//
//  Created by 阿福 on 22/02/2025.
//

import SwiftUI

struct DetailView: View {
    var habit: Habit
    var habitStore: HabitStore
    
    var body: some View {
        Text(habit.description ?? "")
            .font(.subheadline)
            .padding()
        
        Button("Add Count") {
            habitStore.increaseComplentionCount(habit)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .padding(.vertical, 30)
        
        Spacer()
        
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(
        habit: Habit(title: "习惯示例", description: "这是一个习惯的描述", completionCount: 5),
        habitStore: HabitStore()
    )
}
