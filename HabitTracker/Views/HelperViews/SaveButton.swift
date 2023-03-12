//
//  SaveButton.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 12.03.2023.
//

import SwiftUI

struct SaveButton: View {
    
    @State private var showSaveAlert = false
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        
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
}


struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
            .environmentObject(ViewModel())
    }
}
