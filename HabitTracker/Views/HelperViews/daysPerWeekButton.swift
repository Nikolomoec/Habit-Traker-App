//
//  daysPerWeekButton.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct daysPerWeekButton: View {
    
    var colorState: Bool
    var number: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 5)
                .background(
                    Rectangle()
                        .foregroundColor(
                            colorState ? .blue : .black
                        )
                )
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            Text(number)
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
        }
    }
}

struct daysPerWeekButton_Previews: PreviewProvider {
    static var previews: some View {
        daysPerWeekButton(colorState: false, number: "1")
    }
}
