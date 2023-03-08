//
//  TextFieldView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 08.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var habitName: String
    
    var body: some View {
        ZStack {
            TextField("", text: $habitName)
                .padding(.trailing)
                .foregroundColor(.black)
                .bold()
                .font(.title2)
                .padding(.horizontal, 15)
                .background (
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                        .background(Color.white)
                        .frame(height:70)
                )
                .padding()
                .tint(.black)
            if !habitName.isEmpty {
                Button {
                    habitName = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.leading, 360)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(habitName: .constant("name"))
    }
}
