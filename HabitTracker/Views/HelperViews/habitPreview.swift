//
//  habitPreview.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 09.03.2023.
//

import SwiftUI

struct habitPreview: View {
    
    @AppStorage(Constants.Config.streak) var streak = 0
    @AppStorage(Constants.Config.canUserPress) var canUserPress = true
    @AppStorage(Constants.Config.lastUserDate) var lastUserDate = Date()
    @AppStorage(Constants.Config.controlScore) var controlScore = true
    @EnvironmentObject var model: ViewModel
    
    private let dayLetters = ["M", "T", "W", "T", "F", "S","S"]
    
    var accentColor: Color
    var name: String
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                    .background(
                        !canUserPress ? accentColor.opacity(0.1) : .white
                            .opacity(0.2)
                    )
                    .cornerRadius(7)
                
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
                            canUserPress.toggle()
                            if canUserPress {
                                DispatchQueue.main.async {
                                    lastUserDate = Date()
                                }
                                if controlScore {
                                    streak += 1
                                    model.streakHeightCalc()
                                    controlScore.toggle()
                                }
                            }
                        } label: {
                            ZStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(!canUserPress ? accentColor : .gray)
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
                        .padding(.leading, 10)
                        .padding(.top, 7)
                        .padding(.bottom, 2)
                    
                    HStack {
                        ForEach(dayLetters, id: \.self) { day in
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                                    .frame(width: 20, height: 20)
                                    .background(
                                        !canUserPress ? accentColor.opacity(0.15) : .white
                                    )
                                Text(day)
                                    .font(.caption2)
                                    .bold()
                                    .foregroundColor(accentColor)
                                    .padding(3)
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                }
                
            }
            .frame(width: 230, height: 150)
            .padding()
        }
    }
}

struct habitPreview_Previews: PreviewProvider {
    static var previews: some View {
        habitPreview(accentColor: .red, name: "Walk a Dog")
            .environmentObject(ViewModel())
    }
}
