//
//  Constants.swift
//  HabitTracker
//
//  Created by Nikita Kolomoec on 06.03.2023.
//

import Foundation
import SwiftUI

struct Constants {
    
    static let strokeWidth = 1.4
    
    struct Config {
        
        // UserDefaults Keys
        static let streak = "streak"
        static let streakHeight = "streakHeight"
        static let canUserPress = "canUserPress"
        static let lastUserDate = "lastUserDate"
        static let controlScore = "controlScore"
        static let daysComp = "daysComp"
        
    }
    struct ColorPalattes {
        static let standart = [Color("blue"), Color("green"), Color("lightBlue"), Color("orange"), Color("purple"), Color("red"), Color("turquoise"), Color("yellow")]
        static let soft = [Color("brownS"), Color("darkGreenS"), Color("greenS"), Color("pinkS"), Color("purpleS"), Color("turquoiseS"), Color("woodS"), Color("yellowS")]
        static let bright = [Color("darkBlueB"), Color("greenB"), Color("lightBlueB"), Color("orangeB"), Color("purpleB"), Color("redB"), Color("toxicB"), Color("yellowB")]
    }
}
