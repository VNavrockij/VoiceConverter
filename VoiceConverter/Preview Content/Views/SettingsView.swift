//
//  SettingsView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 12.02.2025.
//

import SwiftUI

struct SettingsView: View {
    let settingsOptions = [
        "Rate Us",
        "Share App",
        "Contact Us",
        "Restore Purchases",
        "Privacy Policy",
        "Terms of Use"
    ]

    var body: some View {
        ZStack {
            BGGradientView()

            VStack {
                Text("Settings")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 20)

                VStack(spacing: 12) {
                    ForEach(settingsOptions, id: \.self) { option in
                        SettingsRow(title: option)
                    }
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

struct SettingsRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "#d6dcff"))
        .cornerRadius(12)
    }
}
