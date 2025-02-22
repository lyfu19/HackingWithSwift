//
//  ContentView.swift
//  HabitTracking
//
//  Created by 阿福 on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var habitStore = HabitStore()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List($habitStore.habits) { $habit in
                NavigationLink(value: habit) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(habit.title)
                                .font(.headline)
                            Text(habit.description ?? "")
                                .font(.subheadline)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Text("\(habit.completionCount)")
                    }
                }
            }
            
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingSheet.toggle()
                }
            }
            .navigationTitle("Habit Tracking")
            .sheet(isPresented: $showingSheet) {
                AddView(habitStore: habitStore)
            }
            .navigationDestination(for: Habit.self) { habit in
                DetailView(habit: habit, habitStore: habitStore)
            }
        }
    }
}

#Preview {
    ContentView()
}
