//
//  habitPreview.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 09.03.2023.
//

import SwiftUI

struct habitPreview: View {
    
    @AppStorage(Constants.Config.streak) var streak = 0
    @State private var ifTapped = false
    
    private let dayLetters = ["M", "T", "W", "T", "F", "S","S"]
    
    var accentColor: Color
    var name: String
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text(String(streak))
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                        if streak > 0 {
                            Image(systemName: "flame.fill")
                                .font(.title2)
                                .foregroundColor(accentColor)
                        }
                        
                        Spacer()
                        
                        Button {
                            ifTapped.toggle()
                        } label: {
                            ZStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(ifTapped ? accentColor : .gray)
                                    .bold()
                                    .font(.largeTitle)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    
                    Text("STREAK")
                        .foregroundColor(.gray)
                        .bold()
                        .padding(.leading, 10)
                    
                    Text(name)
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading)
                        .padding(.top, 7)
                    
                    HStack {
                        ForEach(dayLetters, id: \.self) { day in
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                                    .background(
                                        ifTapped ? accentColor : .white
                                    )
                                Text(day)
                                    .bold()
                                    .foregroundColor(accentColor)
                            }
                        }
                    }
                    
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
//                    .background(
//                        ifTapped ? accentColor : .white
//                    )
            }
            .frame(width: 200, height: 170)
            .padding()
        }
    }
}

struct habitPreview_Previews: PreviewProvider {
    static var previews: some View {
        habitPreview(accentColor: .red, name: "Workout")
    }
}
