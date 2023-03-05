//
//  SettingsView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 05.03.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("canUserPress") var canUserPress = true
    
    var body: some View {
        BackgroundGrad()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
