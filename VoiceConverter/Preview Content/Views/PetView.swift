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
    private let size: CGFloat = 180


    var body: some View {
        VStack {
            viewModel.selectedPetView(size)
        }
    }
}

