//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct HabitListView: View {
    
    @State private var showAlert = false
    
    private var columns = [
        GridItem(.fixed(205)),
        GridItem(.fixed(205))
        ]
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    ForEach(model.habits) { habit in
                        habitPreview(accentColor: habit.habitColor, name: habit.name, daysPerWeek: habit.daysPerWeek)
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Today")
            .toolbar {
                Button {
                    if model.habits.count > 5 {
                        showAlert = true
                    } else {
                        model.newHabitSheet = true
                    }
                } label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $model.newHabitSheet) {
                    AddHabit()
                }
            }
        }
    }
}



struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
            .environmentObject(ViewModel())
    }
}
