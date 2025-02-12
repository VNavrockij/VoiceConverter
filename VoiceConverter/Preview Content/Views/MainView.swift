//
//  MainView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        ZStack {
            BGGradientView()

            VStack {
                HeaderView
                    .padding([.top, .bottom], 32)

                SpeakView()
                    .padding(.bottom, 32)

                PetView()
                    .padding(.bottom, 32)

                TabBarView()

                Spacer()
            }


        }
    }

    private var HeaderView: some View {
        VStack {
            Text("Translator")
                .font(.custom(Constants.konkhmerFont, size: 32))
                .padding(.bottom, 32)
                .foregroundColor(.black)

            HStack(spacing: 60) {
                Text(viewModel.human)
                    .textCase(.uppercase)
                    .font(.custom(Constants.konkhmerFont, size: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)

                Button {
                    viewModel.swapHumanAndPet()
                } label: {
                    Image(.arrowSwapHorizontal)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .frame(maxWidth: .infinity)

                Text(viewModel.pet)
                    .textCase(.uppercase)
                    .font(.custom(Constants.konkhmerFont, size: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
            }
            .frame(width: 300)
//            .background(.red)
        }
        .frame(maxWidth: .infinity)
        .padding()
//        .background(.white)
    }
}

#Preview {
    MainView()
        .environmentObject(AppViewModel())
}
