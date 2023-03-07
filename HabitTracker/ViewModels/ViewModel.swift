//
//  ViewModel.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 04.03.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var habits = [HabitModel]()
    @Published var templates = [HabitTemplates]()
    @Published var addHabitSheet = false
    
    func canUserPressCalc() {
        let lastUserDate = UserDefaults.standard.value(forKey: Constants.Config.lastUserDate)
        let canUserPress = !Calendar.current.isDateInToday(lastUserDate as? Date ?? Date())
        DispatchQueue.main.async {
            UserDefaults.standard.set(canUserPress, forKey: Constants.Config.canUserPress)
        }
    }
    
    func streakHeightCalc() {
        let streak = UserDefaults.standard.value(forKey: Constants.Config.streak) as! Int
        let streakHeight = UserDefaults.standard.value(forKey: Constants.Config.streakHeight) as? Int ?? 0
        if streak >= streakHeight {
            DispatchQueue.main.async {
                UserDefaults.standard.set(streak, forKey: Constants.Config.streakHeight)
            }
        }
    }
    
    func addHabbit(name: String, daysPerWeek: Int, habitColor: Int) {
        habits.append(HabitModel(name: name, daysPerWeek: daysPerWeek + 1, habitColor: habitColor))
    }
}
