//
//  PetView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI

import SwiftUI

struct PetView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        VStack {
            switch viewModel.selectedPet {
                case .cat:
                    Image(.cat)
                        .resizable()
                        .frame(width: 180, height: 180)
                case .dog:
                    Image(.dog)
                        .resizable()
                        .frame(width: 180, height: 180)
            }

            Text(viewModel.petReaction)
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.top, 10)
                .transition(.opacity)
        }
    }
}

