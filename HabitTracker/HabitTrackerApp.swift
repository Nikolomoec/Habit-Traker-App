//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    
    @AppStorage("canUserPress") var canUserPress = true
    @AppStorage("lastUserDate") var lastUserDate = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear {
                    DispatchQueue.main.async {
                        canUserPress = !(Calendar.current.component(.day, from: lastUserDate) == Calendar.current.component(.day, from: Date()))
                    }
                }
        }
    }
}
