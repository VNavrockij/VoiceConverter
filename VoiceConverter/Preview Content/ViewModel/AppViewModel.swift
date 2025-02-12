//
//  AppViewModel.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI

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
    @Published var lastPhrase: String = ""
    @Published var isRepeatPresed: Bool = false

    private let catPhrases = ["I want milk!", "Play with me!"]
    private let dogPhrases = ["Let's go for a walk!", "Give me something tasty!"]

    func swapHumanAndPet() {
        let temp = human
        human = pet
        pet = temp
    }

    func showPetReaction() {
        switch selectedPet {
        case .cat:
            petReaction = catPhrases.randomElement() ?? "Meow meow!"
        case .dog:
            petReaction = dogPhrases.randomElement() ?? "Bark-Bark!"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.lastPhrase = self.petReaction
            self.petReaction = "Repeat"
        }
    }

    func selectedPetView(_ size: CGFloat) -> some View {
        switch selectedPet {
        case .cat:
            Image(.cat)
                .resizable()
                .frame(width: size, height: size)
        case .dog:
            Image(.dog)
                .resizable()
                .frame(width: size, height: size)
        }
    }

    func toggleRepeatPresed() {
        isRepeatPresed.toggle()
        petReaction = lastPhrase
    }
}
