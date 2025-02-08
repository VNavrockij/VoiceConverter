//
//  ContentView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 06.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            backgroundGradient

            VStack {
                Text("Hello, Eugen")
                    .font(.custom("KonkhmerSleokchherRegular", size: 30))
            }
        }

    }
}

private var backgroundGradient: some View {
    LinearGradient(gradient: Gradient(
        colors: [Color.init(hex: Constants.Colors.topMainColor.rawValue),
                 Color.init(hex: Constants.Colors.bottomMainColor.rawValue)]),
                   startPoint: .top,
                   endPoint: .bottom)
        .ignoresSafeArea()
}

#Preview {
    ContentView()
}
