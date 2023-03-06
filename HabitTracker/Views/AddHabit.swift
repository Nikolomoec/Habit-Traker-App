//
//  addHabit.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct AddHabit: View {
    
    @State var colorState = [false,false,false,true,false,false,false]
    @State var selectedButtonNumber = 3
    
    var body: some View {
        VStack {
            // Heading
            HStack {
                
                Button("Cancel") {
                    
                }
                
                Spacer()
                
                Text("New Habit")
                    .bold()
                
                Spacer()
                
                Button("Save") {
                    
                }
            }
            .padding(.horizontal)
            
            // Main
            Text("How many days per week should you comlete that habit?")
                .bold()
                .font(.title2)
            HStack {
                ForEach(1...7, id: \.self) { number in
                    
                    Button {
                        colorState[selectedButtonNumber].toggle()
                        colorState[number-1].toggle()
                        selectedButtonNumber = number - 1
                    } label: {
                        daysPerWeekButton(colorState: colorState[number-1], number: number)
                    }
                    
                }
            }
            // Color Picker
            Text("")
            
        }
    }
}

struct addHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
    }
}
