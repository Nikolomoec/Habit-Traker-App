//
//  AddHabitHeaderView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 12.03.2023.
//

import SwiftUI

struct CancelButton: View {
    
    @State private var showCancelAlert = false
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
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
        
    }
}

struct AddHabitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton()
            .environmentObject(ViewModel())
    }
}
