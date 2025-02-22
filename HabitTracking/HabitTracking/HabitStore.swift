//
//  HabitStore.swift
//  HabitTracking
//
//  Created by 阿福 on 22/02/2025.
//

import Foundation

struct Habit: Identifiable, Hashable, Codable {
    var id = UUID()
    let title: String
    let description: String?
    var completionCount = 0
}

@Observable
class HabitStore {
    var habits = [Habit]() {
        didSet {
            saveHabits()
        }
    }
    
    init() {
        loadHabits()
    }
    
    func increaseComplentionCount(_ habit: Habit) {
        for i in habits.indices {
            if habits[i].id == habit.id {
                habits[i].completionCount += 1
                break
            }
        }
    }
    
    private func saveHabits() {
        do {
            let data = try JSONEncoder().encode(habits)
            UserDefaults.standard.setValue(data, forKey: "savedHabits")
        } catch {
            print("❌ save Habits failed: \(error)")
        }
    }
    
    private func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: "savedHabits") else { return }
        do {
            habits = try JSONDecoder().decode([Habit].self, from: data)
        } catch {
            print("❌ load Habits fail: \(error)")
        }
    }
}
