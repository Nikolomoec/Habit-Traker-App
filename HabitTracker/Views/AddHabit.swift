//
//  addHabit.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct AddHabit: View {
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
            
            ForEach(1...7, id: \.self) { index in
                
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
