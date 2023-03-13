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
        Text(String(number))
            .foregroundColor(colorState ? .white : .black)
            .bold()
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("stroke"), lineWidth: colorState ? 0 : Constants.strokeWidth)
            )
            .background(colorState ? .blue : .white)
            .cornerRadius(10)
    }
}

struct daysPerWeekButton_Previews: PreviewProvider {
    static var previews: some View {
        daysPerWeekButton(colorState: false, number: 1)
    }
}
