//
//  PetReactionView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 12.02.2025.
//

import SwiftUI

struct PetReactionView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Binding var isPresented: Bool
    private let size: CGFloat = 150


    var body: some View {
        ZStack {
            BGGradientView()
            VStack {
                HStack(alignment: .bottom) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }

                    Spacer()

                    Text("Result")
                        .font(.custom(Constants.konkhmerFont, size: 32))

                    Spacer(minLength: 130)
                }
                .padding()
                .frame(maxWidth: .infinity)

                Spacer()

                Button {
                    viewModel.toggleRepeatPresed()
                } label: {
                    Text(viewModel.human == "Pet" ? "You're so cute!" : viewModel.petReaction)
                        .font(.custom(Constants.konkhmerFont, size: 18))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(16)
                }
                Spacer()

                viewModel.selectedPetView(size)

                Spacer()

            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
