//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Constants.Config.streak) var streak = 0
    @AppStorage(Constants.Config.streakHeight) var streakHeight = 0
    @AppStorage(Constants.Config.canUserPress) var canUserPress = true
    
    @State private var currentDate = Date()
    @State private var currentTime = Date()

    @EnvironmentObject var model: ViewModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        ZStack {
            
            BackgroundGrad()
            
            VStack {
                HStack {
                    Text(currentDate.formattedMonth)
                        .padding(.horizontal, 10)
                        .onReceive(model.dayChangeNotiflication) { _ in
                            currentDate = Date()
                        }
                    Text(currentTime.formattedTime)
                        .padding(.horizontal, 10)
                        .onReceive(timer) { _ in
                            currentTime = Date()
                        }
                }
                .font(.largeTitle)
                .bold()
                .padding()
                VStack {
                    ButtonView(streak: $streak)
                    HStack {
                        Text("Your Streak: \(streak)")
                        Spacer()
                        Text("Highest Streak: \(streakHeight)")
                    }
                    .padding(40)
                    .bold()
                    .font(.title)
                }
                Spacer()
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

extension Date {
    var formattedMonth: String {
        self.formatted(.dateTime
            .month(.wide)
            .day()
        )
    }
    var formattedTime: String {
        self.formatted(.dateTime
            .hour()
            .minute()
        )
    }
}
extension UserDefaults {
    func color(forKey key: String) -> Color? {
        guard let data = data(forKey: key) else { return nil }
        return try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data).map { Color($0) }
    }
    
    func set(_ color: Color?, forKey key: String) {
        guard let color = color else {
            removeObject(forKey: key)
            return
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(color), requiringSecureCoding: false)
        set(data, forKey: key)
    }
}
