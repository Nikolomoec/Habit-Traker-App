//
//  ColorSelectionView.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 08.03.2023.
//

import SwiftUI

struct ColorSelectionView: View {
    
    @State private var colorPicker = false
    @State private var colorText = "Default - Tap to open picker"
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            Button {
                UIColorWellHelper.helper.execute?()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(model.habitColor)
                        .frame(height:70)
                        .padding()
                    Text(colorText)
                        .shadow(radius: 7)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                }
                .shadow(radius: 5)
                .background(ColorPicker("", selection: $model.habitColor)
                    .labelsHidden().opacity(0))
            }
            Text("Tap the big button above to pick up a custom color, or choose from our favourite palettes below:")
                .padding(.horizontal, 13)
                .padding(.bottom)
                .font(.callout)
            Text("Standart")
                .font(.headline)
                .padding(.trailing, 230)
            Spacer()
        }
    }
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView()
            .environmentObject(ViewModel())
    }
}

extension UIColorWell {

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let uiButton = self.subviews.first?.subviews.last as? UIButton {
            UIColorWellHelper.helper.execute = {
                uiButton.sendActions(for: .touchUpInside)
            }
        }
    }
}

class UIColorWellHelper: NSObject {
    static let helper = UIColorWellHelper()
    var execute: (() -> ())?
    @objc func handler(_ sender: Any) {
        execute?()
    }
}
