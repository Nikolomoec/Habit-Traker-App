//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    
    @AppStorage(Constants.Config.lastUserDate) var lastUserDate = Date()
    
    var body: some Scene {
        WindowGroup {
            HabitTabView()
                .environmentObject(ViewModel())
                .onAppear {
                    
                    let lastUserDay = Calendar.current.component(.day, from: lastUserDate) // 4
                    let todaysDay = Calendar.current.component(.day, from: Date()) // 6
                    
                    UserDefaults.standard.set(!(lastUserDay == todaysDay), forKey: Constants.Config.canUserPress)
                    
                    if lastUserDate.addingTimeInterval(86400*2) < Date() {
                        UserDefaults.standard.set(0, forKey: "streak")
                        
                    }
                }
        }
    }
}
