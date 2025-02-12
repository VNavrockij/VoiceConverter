//
//  BGGradientView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 12.02.2025.
//

import SwiftUI

struct BGGradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(
            colors: [Color.init(hex: Constants.Colors.topMainColor.rawValue),
                     Color.init(hex: Constants.Colors.bottomMainColor.rawValue)]),
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}
