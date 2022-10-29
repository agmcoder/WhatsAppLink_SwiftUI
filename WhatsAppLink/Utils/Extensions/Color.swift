//
//  Theme.swift
//  WhatsAppLink
//
//  Created by agmcoder on 26/10/22.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ThemeColor()
}

struct ThemeColor{
    let fontColor = Color("FontColors")
    let accent = Color("AccentColor")
    let codeCountry = Color("CodeCountryColor")
}


