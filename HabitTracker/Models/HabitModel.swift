//
//  Model.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import Foundation

class HabitModel: Identifiable {
    
    var name: String
    var id: UUID?
    var date: Date
    var daysPerWeek: Int
    var habitColor: Int
    
    init() {
        self.id = UUID()
        self.date = Date()
        self.name = "Workout"
        self.daysPerWeek = 3
        self.habitColor = 1
    }
}
