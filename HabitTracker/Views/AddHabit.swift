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
    @State private var showCancelAlert = false
    @State private var showSaveAlert = false
    @State private var habitName = ""
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            // MARK: - Heading
            HStack {
                
                Button("Cancel") {
                    showCancelAlert.toggle()
                }
                .alert(isPresented: $showCancelAlert) {
                    Alert(title: Text("Warning"),
                          message: Text("If you made changes, they will be discarded"),
                          primaryButton: .destructive(Text("Discard changes"), action: {
                          model.addHabitSheet = false
                          }),
                          secondaryButton: .cancel())
                }
                
                Spacer()
                
                Text("New Habit")
                    .bold()
                
                Spacer()
                
                Button("Save") {
                    if habitName == "" {
                        showSaveAlert.toggle()
                    } else {
                        model.addHabbit(name: habitName, daysPerWeek: selectedButtonNumber, habitColor: 1)
                        model.addHabitSheet = false
                    }
                }
                .alert(isPresented: $showSaveAlert) {
                    Alert(title: Text("Your habit needs a name"), dismissButton: .cancel(Text("OK")))
                }
            }
            .padding()
            .font(.title2)
            
            // MARK: - Main
            
            Text("Habit name")
                .bold()
                .font(.title)
                .padding(.horizontal, 12)
            
                TextField("", text: $habitName)
                .foregroundColor(.black)
                .bold()
                .font(.title2)
                .padding(.horizontal, 16)
                .background (
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(.gray)
                        .frame(height:70)
                )
                .padding()

            Text("Templates:")
                .font(.title3)
                .padding(13)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(model.templates) { habit in
                        Button {
                            habitName = habit.name
                        } label: {
                            Text(habit.name)
                                .bold()
                                .font(.title3)
                                .padding(10)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .foregroundColor(.black)
                                    )
                            .padding(.horizontal, 4)
                        }
                        .tint(.black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 13)
            Text("How many days per week should you comlete that habit?")
                .bold()
                .font(.title)
                .padding(.horizontal, 13)
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
            
            // MARK: - Color Picker
            Text("")
            
            Spacer()
        }
    }
}

struct addHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
            .environmentObject(ViewModel())
    }
}
