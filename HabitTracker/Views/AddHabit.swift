//
//  addHabit.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct AddHabit: View {
    
    @State private var colorState = [false,false,false,true,false,false,false]
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    // MARK: - Main
                    Group {
                        Text("Habit name")
                            .bold()
                            .font(.title)
                            .padding(.horizontal, 12)
                        
                        TextFieldView(habitName: $model.habitName)
                        
                        Text("Templates:")
                            .font(.title3)
                            .padding(13)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(model.templates) { habit in
                                    Button {
                                        model.habitName = habit.name
                                    } label: {
                                        Text(habit.name)
                                            .bold()
                                            .font(.title3)
                                            .padding(10)
                                            .foregroundColor(.black)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                                                    .background(Color.white)
                                            )
                                            .padding(.horizontal, 4)
                                            .padding(.bottom)
                                    }
                                    .tint(.black)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 13)
                    }
                    Text("How many days per week should you comlete that habit?")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal, 13)
                    HStack {
                        ForEach(1...7, id: \.self) { number in
                            
                            Button {
                                colorState[model.selectedButtonNum].toggle()
                                colorState[number-1].toggle()
                                model.selectedButtonNum = number - 1
                            } label: {
                                daysPerWeekButton(colorState: colorState[number-1], number: number)
                            }
                            
                        }
                    }
                    .padding(10)
                    
                    Text("You can change your goal at any time.")
                        .padding(.horizontal, 13)
                        .padding(.bottom)
                        .font(.callout)
                    // MARK: - Color Picker
                    Text("Habit color")
                        .bold()
                        .font(.title)
                        .padding(.horizontal, 12)
                    
                    ColorSelectionView()
                    
                    Spacer()
                }
                .interactiveDismissDisabled()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    CancelButton()
                        .font(.title2)
                }
                ToolbarItem(placement: .principal) {
                    Text("New Habit")
                        .bold()
                        .font(.title2)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    SaveButton()
                        .font(.title2)
                }
            }
            .toolbarBackground(.white, for: .navigationBar)
        }
    }
}

struct addHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
            .environmentObject(ViewModel())
    }
}
