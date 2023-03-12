//
//  AddHabitHeaderView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 12.03.2023.
//

import SwiftUI

struct AddHabitHeaderView: View {
    
    @State private var showCancelAlert = false
    @State private var showSaveAlert = false
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        
            HStack {
                
                Button("Cancel") {
                    showCancelAlert.toggle()
                }
                .alert(isPresented: $showCancelAlert) {
                    Alert(title: Text("Warning"),
                          message: Text("If you made changes, they will be discarded"),
                          primaryButton: .destructive(Text("Discard changes"), action: {
                        model.newHabitSheet = false
                    }),
                          secondaryButton: .cancel())
                }
                
                Spacer()
                
                Text("New Habit")
                    .bold()
                
                Spacer()
                
                Button("Save") {
                    if model.habitName == "" {
                        showSaveAlert.toggle()
                    } else {
                        model.addHabbit(name: model.habitName, daysPerWeek: model.selectedButtonNum, habitColor: model.habitColor)
                        model.newHabitSheet = false
                    }
                }
                .alert(isPresented: $showSaveAlert) {
                    Alert(title: Text("Your habit needs a name"), dismissButton: .cancel(Text("OK")))
                }
            }
            .padding()
            .font(.title2)
    }
}

struct AddHabitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitHeaderView()
            .environmentObject(ViewModel())
    }
}
