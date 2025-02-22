//
//  AddView.swift
//  HabitTracking
//
//  Created by 阿福 on 22/02/2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var habitStore: HabitStore
    
    @State private var title = ""
    @State private var description = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add Habit") {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard !title.isEmpty else {
                            showingAlert.toggle()
                            return
                        }
                        let habit = Habit(title: title, description: description)
                        habitStore.habits.append(habit)
                        dismiss()
                    }
                }
            }
            .alert("Warning", isPresented: $showingAlert) {} message: {
                Text("Title can not be empty")
            }

        }
    }
}

#Preview {
    AddView(habitStore: HabitStore())
}
