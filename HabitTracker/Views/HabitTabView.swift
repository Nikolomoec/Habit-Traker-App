//
//  TabView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 05.03.2023.
//

import SwiftUI

struct HabitTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Habit List")
                    }
                }
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
                }
        }
    }
}

struct HabitTabView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTabView()
    }
}
