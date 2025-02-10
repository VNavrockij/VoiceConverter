//
//  AppViewModel.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI

enum SelectedAnimal {
    case cat
    case dog
}

class AppViewModel: ObservableObject {
    @Published var human: String = "Human"
    @Published var pet: String = "Pet"
    @Published var selectedPet: SelectedAnimal = .cat
    @Published var isRecording = false
    @Published var petReaction: String = ""

    func swapHumanAndPet() {
        let temp = human
        human = pet
        pet = temp
    }

    func showPetReaction() {
        switch selectedPet {
        case .cat:
            petReaction = "Мяу-мяу!"
        case .dog:
            petReaction = "Гав-гав!"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.petReaction = ""
        }
    }
}
