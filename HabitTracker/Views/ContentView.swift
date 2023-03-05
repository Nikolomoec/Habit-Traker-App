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
    @AppStorage("canUserPress") var canUserPress = true
    
    @State private var currentDate = Date()
    @State private var currentTime = Date()

    @EnvironmentObject var model: ViewModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        ZStack {
                LinearGradient (gradient: canUserPress ?
                  Gradient(colors: [Color("backNotAdded1"), Color("backNotAdded2")]) :
                  Gradient(colors: [Color("backAdded1"), Color("backAdded2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .animation(.easeInOut(duration: 2), value: canUserPress)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(currentDate.formattedMonth)
                        .padding(.horizontal, 10)
                        .onReceive(NotificationCenter.default.publisher(for: Notification.Name.NSCalendarDayChanged)) { _ in
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
