//
//  ViewModel.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 04.03.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var canUserPress = true
    
    func canUserPressCalc() {
        let lastUserDate = UserDefaults.standard.value(forKey: "lastUserDate")
        canUserPress = !Calendar.current.isDateInToday(lastUserDate as? Date ?? Date())
        UserDefaults.standard.set(canUserPress, forKey: "canUserPress")
    }
}
