//
//  addHabit.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct AddHabit: View {
    
    @State private var colorState = [false,false,false,true,false,false,false]
    @State private var selectedButtonNumber = 3
    @State private var showAlert = false
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            // Heading
            HStack {
                
                Button("Cancel") {
                    showAlert.toggle()
                }
                .alert("Warning", isPresented: $showAlert) {
                    Text("If you made changes, they will be discarded")
                    Button  {
                        // TODO addHabit .sheet = false
                    } label: {
                        Text("Discard changes")
                    }

                }
                
                Spacer()
                
                Text("New Habit")
                    .bold()
                
                Spacer()
                
                Button("Save") {
                    model.addHabbit(name: "name", daysPerWeek: selectedButtonNumber, habitColor: 1)
                }
            }
            .padding()
            .font(.title2)
            
            // Main
            
            Text("Habit name")
                .bold()
                .font(.title)
                .padding(.horizontal, 12)
            //TextField

            Text("How many days per week should you comlete that habit?")
                .bold()
                .font(.title)
                .padding(.horizontal, 12)
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
            .padding()
            // Color Picker
            Text("")
            
        }
    }
}

struct addHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
            .environmentObject(ViewModel())
    }
}
