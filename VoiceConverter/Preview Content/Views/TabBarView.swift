//
//  TabBarView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI

import SwiftUI

struct TabBarView: View {
    @State private var isSettingsPresented = false

    var body: some View {
        HStack {
            Button {
                print("Translator tapped")
            } label: {
                VStack {
                    Image(.messages)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                    Text("Translator")
                        .font(.custom(Constants.konkhmerFont, size: 12))
                        .foregroundColor(.black)
                }
            }

            Spacer()

            Button {
                isSettingsPresented.toggle()
            } label: {
                VStack {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                    Text("Settings")
                        .font(.custom(Constants.konkhmerFont, size: 12))
                        .foregroundColor(.black)
                }
            }
            .popover(isPresented: $isSettingsPresented) {
                SettingsView()
            }
        }
        .frame(width: 140)
        .padding()
        .background(.white)
        .cornerRadius(12)
    }
}

