//
//  ViewModel.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 04.03.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var habitArray = [HabitModel]()
    @Published var addHabitSheet = false
    
    func canUserPressCalc() {
        let lastUserDate = UserDefaults.standard.value(forKey: "lastUserDate")
        let canUserPress = !Calendar.current.isDateInToday(lastUserDate as? Date ?? Date())
        DispatchQueue.main.async {
            UserDefaults.standard.set(canUserPress, forKey: "canUserPress")
        }
    }
    
    func streakHeightCalc() {
        let streak = UserDefaults.standard.value(forKey: "streak") as! Int
        let streakHeight = UserDefaults.standard.value(forKey: "streakHeight") as? Int ?? 0
        if streak >= streakHeight {
            DispatchQueue.main.async {
                UserDefaults.standard.set(streak, forKey: "streakHeight")
            }
        }
    }
    
    func addHabbit(name: String, daysPerWeek: Int, habitColor: Int) {
        habitArray.append(HabitModel(name: name, daysPerWeek: daysPerWeek, habitColor: habitColor))
    }
}
