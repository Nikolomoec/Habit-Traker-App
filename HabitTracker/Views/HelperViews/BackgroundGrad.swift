//
//  BackgroundGrad.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 05.03.2023.
//

import SwiftUI

struct BackgroundGrad: View {
    @AppStorage(Constants.Config.canUserPress) var canUserPress = true
    var body: some View {
        LinearGradient (gradient: canUserPress ?
          Gradient(colors: [Color("backNotAdded1"), Color("backNotAdded2")]) :
          Gradient(colors: [Color("backAdded1"), Color("backAdded2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .animation(.easeInOut(duration: 2), value: canUserPress)
        .ignoresSafeArea()
    }
}

struct BackgroundGrad_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGrad()
    }
}
