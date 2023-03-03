//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("streak") var streak = 0
    @AppStorage("streakHeight") var streakHeight = 0
    var body: some View {
        VStack {
            HStack {
                Text(Date().formattedMonth)
                Spacer()
                Text(Date().formattedTime)
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
