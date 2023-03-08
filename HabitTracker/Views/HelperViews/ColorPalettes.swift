//
//  ColorPalettes.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 08.03.2023.
//

import SwiftUI

struct ColorPalettes: View {
    
    var name: String
    var palettes: [Color]
    
    let columns = [
            GridItem(.adaptive(minimum: 50))
        ]
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        Text(name)
            .font(.headline)
            .padding(.leading, 35)
        LazyVGrid(columns: columns) {
            ForEach(palettes, id: \.self) { palette in
                Button {
                    model.habitColor = palette
                } label: {
                    ZStack {
                        Circle()
                            .fill(palette)
                            .shadow(radius: 5)
                            .padding(2)
                        if palette == model.habitColor  {
                            Image(systemName: "checkmark")
                                .bold()
                                .font(.title2)
                                .shadow(radius: 5)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

