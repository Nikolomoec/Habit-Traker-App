//
//  Model.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import Foundation
import SwiftUI

class HabitModel: Identifiable {
    
    var name: String
    var id: UUID?
    var date: Date
    var daysPerWeek: Int
    var habitColor: Color
    
    init(name: String, daysPerWeek: Int, habitColor: Color) {
        self.id = UUID()
        self.date = Date()
        self.name = name
        self.daysPerWeek = daysPerWeek
        self.habitColor = habitColor
    }
}

class HabitTemplates: Identifiable, Decodable {
    
    var id: Int
    var name: String
    
}
