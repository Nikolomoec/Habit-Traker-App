//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
