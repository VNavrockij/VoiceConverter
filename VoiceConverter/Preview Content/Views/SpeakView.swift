//
//  SpeakView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import SwiftUI
import AVFoundation

struct SpeakView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @StateObject private var audioRecorder = AudioRecorder()

    var body: some View {
        HStack {
            Button {
                if audioRecorder.permissionStatus == .granted {
                    if audioRecorder.isRecording {
                        audioRecorder.stopRecording()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.showPetReaction()
                        }
                    } else {
                        audioRecorder.startRecording()
                    }
                } else {
                    print("Нет разрешения")
                }
            } label: {
                VStack {
                    Image(systemName: audioRecorder.isRecording ? "mic.fill" : "mic")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 50, height: 70)
                        .padding(.bottom, 24)
                    Text(audioRecorder.isRecording ? "Stop speak" : "Start speak")
                        .font(.custom(Constants.konkhmerFont, size: 16))
                        .foregroundColor(.black)
                }
            }
            .frame(width: 140, height: 170)
            .padding()
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 1)

            Spacer(minLength: 40)

            VStack {
                Button {
                    viewModel.selectedPet = .cat
                    print("Выбран кот")
                } label: {
                    Image(.cat)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding()
                .background(Color.init(hex: "#d0e7fc"))
                .cornerRadius(8)

                Button {
                    viewModel.selectedPet = .dog
                    print("Выбрана собака")
                } label: {
                    Image(.dog)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding()
                .background(Color.init(hex: "#eef7da"))
                .cornerRadius(12)
            }
            .padding()
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 1)
        }
        .frame(width: 300, height: 200)
        .padding()
        .onAppear {
            audioRecorder.checkMicrophonePermission()
            if audioRecorder.permissionStatus == .undetermined {
                audioRecorder.requestPermission()
            }
        }
    }
}


#Preview {
    SpeakView()
        .environmentObject(AppViewModel())
}
