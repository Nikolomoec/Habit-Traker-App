//
//  ViewModel.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 04.03.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @AppStorage(Constants.Config.canUserPress) private var canUserPress = true
    
    @Published var habits = [HabitModel]()
    @Published var templates = [HabitTemplates]()
    @Published var addHabitSheet = false
    @Published var habitColor = Color.blue
    @Published var dayChangeNotiflication = NotificationCenter.default.publisher(for: Notification.Name.NSCalendarDayChanged)
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    init() {
        getRemoteData()
        
        for day in Array(1...7) {
            UserDefaults.standard.set(false, forKey: "dayWasChecked\(day)")
        }
    }
    
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
    
    func addHabbit(name: String, daysPerWeek: Int, habitColor: Color) {
        habits.append(HabitModel(name: name, daysPerWeek: daysPerWeek + 1, habitColor: habitColor))
    }
    
    func isTodaysDateChecked() {
        let todaysDayNumber = Calendar.current.component(.weekday, from: Date())
        
        for day in Array(1...7) {
            let dayState = UserDefaults.standard.value(forKey: "dayWasChecked\(day)")
            
            if todaysDayNumber <= day && !(dayState as! Bool) {
                
            }
        }
    }
    
    func getRemoteData() {
        
        let strPath = "https://raw.githubusercontent.com/Nikolomoec/HabitTrackerResources/main/templates.json"
        
        let url = URL(string: strPath)
        
        guard url != nil else { return }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else { return }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([HabitTemplates].self, from: data!)
                
                DispatchQueue.main.async {
                    self.templates += decodedData
                }
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
