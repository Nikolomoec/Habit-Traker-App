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
    private var canUserPress = UserDefaults.standard.value(forKey: "canUserPress")
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        ZStack {
            
            model.canUserPress as! Bool ?
            LinearGradient(gradient: Gradient(colors: [Color("backNotAdded1"), Color("backNotAdded2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() :
            LinearGradient(gradient: Gradient(colors: [Color("backAdded1"), Color("backAdded2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(Date().formattedMonth)
                        .padding(.horizontal, 10)
                    Text(Date().formattedTime)
                        .padding(.horizontal, 10)
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
