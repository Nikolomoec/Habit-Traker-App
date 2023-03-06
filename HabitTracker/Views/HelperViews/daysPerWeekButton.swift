//
//  daysPerWeekButton.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct daysPerWeekButton: View {
    
    var colorState: Bool
    var number: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 3)
                .background(
                    Rectangle()
                        .foregroundColor(
                            colorState ? .blue : .black
                        )
                )
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            Text(String(number))
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
        }
    }
}

struct daysPerWeekButton_Previews: PreviewProvider {
    static var previews: some View {
        daysPerWeekButton(colorState: false, number: 1)
    }
}
