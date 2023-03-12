//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import SwiftUI

struct HabitListView: View {
    
    @State private var showAlert = false
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                
                ScrollView {
                    
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
}


struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
            .environmentObject(ViewModel())
    }
}
