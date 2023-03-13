//
//  habitPreview.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 09.03.2023.
//

import SwiftUI

struct habitPreview: View {
    
    @AppStorage(Constants.Config.streak) private var streak = 0
    @AppStorage(Constants.Config.canUserPress) private var canUserPress = true
    @AppStorage(Constants.Config.lastUserDate) private var lastUserDate = Date()
    @AppStorage(Constants.Config.controlScore) private var controlScore = true
    
    @AppStorage(Constants.Config.daysComp) private var daysCompleted = 0
    
    @EnvironmentObject var model: ViewModel
    
    var accentColor: Color
    var name: String
    var daysPerWeek: Int
    
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
                            model.isTodaysDateChecked()
                            if canUserPress {
                                DispatchQueue.main.async {
                                    lastUserDate = Date()
                                }
                                streak += 1
                                daysCompleted += 1
                                model.streakHeightCalc()
                                canUserPress.toggle()
                                
                            } else {
                                streak -= 1
                                daysCompleted -= 1
                                canUserPress.toggle()
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
                        HStack(spacing: 4) {
                            ForEach(model.days, id: \.self) { day in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("stroke"), lineWidth: Constants.strokeWidth)
                                        .frame(width: 16, height: 16)
                                        .background(
                                            !canUserPress ? accentColor.opacity(0.15) : .white
                                        )
                                    Text(day.prefix(1))
                                        .font(.caption2)
                                        .bold()
                                        .foregroundColor(accentColor)
                                        .padding(3)
                                    
                                }
                            }
                        }
                        Text("\(daysCompleted)/\(daysPerWeek)")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                }
                
            }
            .frame(width: 190, height: 150)
            .padding(5)
        }
    }
}

struct habitPreview_Previews: PreviewProvider {
    static var previews: some View {
        habitPreview(accentColor: .red, name: "Walk a Dog", daysPerWeek: 4)
            .environmentObject(ViewModel())
    }
}
