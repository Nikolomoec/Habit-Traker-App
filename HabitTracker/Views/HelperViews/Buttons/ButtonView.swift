//
//  ButtonView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var streak: Int
    
    @AppStorage(Constants.Config.controlScore) private var controlScore = true
    @AppStorage(Constants.Config.canUserPress) private var canUserPress = true
    @AppStorage(Constants.Config.lastUserDate) private var lastUserDate = Date() {
        didSet {
            model.canUserPressCalc()
        }
    }
    
    @EnvironmentObject var model: ViewModel
    
    private var buttonColor: LinearGradient {
        return LinearGradient(gradient: canUserPress ?
            Gradient(colors: [Color("buttonNotAdded1"), Color("buttonNotAdded2")]) :
                                Gradient(colors: [Color("buttonAdded1"), Color("buttonAdded2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    var body: some View {
            Button {
                if canUserPress {
                    DispatchQueue.main.async {
                        lastUserDate = Date()
                    }
                        streak += 1
                    model.streakHeightCalc()
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(buttonColor)
                        .animation(.easeInOut(duration: 2), value: canUserPress)
                        .frame(width: 200, height: 200)
                    
                    Text("Add!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                }
                
            }
            .onReceive(model.dayChangeNotiflication) { _ in
                DispatchQueue.main.async {
                    canUserPress = true
                    controlScore = true
                    if lastUserDate.addingTimeInterval(86400*2) < Date() {
                        UserDefaults.standard.set(0, forKey: Constants.Config.streak)
                    }
                }
            }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(streak: .constant(0))
            .environmentObject(ViewModel())
    }
}

extension Date: RawRepresentable{
    public var rawValue: String {
        self.timeIntervalSince1970.description
    }
    
    public init?(rawValue: String) {
        guard let interval = TimeInterval(rawValue) else {
            return nil
        }
        self = Date(timeIntervalSince1970: interval)
    }
}
