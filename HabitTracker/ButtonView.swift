//
//  ButtonView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 27.02.2023.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var streak: Int
    
    @AppStorage("canUserPress") private var canUserPress = true
    @AppStorage("lastUserDate") private var lastUserDate = Date() {
        didSet {
            model.canUserPressCalc()
        }
    }
    
    @EnvironmentObject var model: ViewModel
    
    private var buttonColor: LinearGradient {
        return canUserPress ?
        LinearGradient(gradient: Gradient(colors: [Color("buttonNotAdded1"), Color("buttonNotAdded2")]), startPoint: .leading, endPoint: .trailing) :
        LinearGradient(gradient: Gradient(colors: [Color("buttonAdded1"), Color("buttonAdded2")]), startPoint: .leading, endPoint: .trailing)
        
    }

    var body: some View {
            Button {
                if canUserPress {
                    lastUserDate = Date()
                    streak += 1
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(buttonColor)
                        .frame(width: 200, height: 200)
                    
                    Text("Add!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
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
