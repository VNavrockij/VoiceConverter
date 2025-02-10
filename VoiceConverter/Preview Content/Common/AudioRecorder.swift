//
//  AudioRecorder.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 08.02.2025.
//

import AVFoundation

class AudioRecorder: ObservableObject {
    var audioRecorder: AVAudioRecorder?
    let fileName = "recordedAudio.m4a"

    @Published var permissionStatus: AVAudioSession.RecordPermission = .undetermined
    @Published var isRecording = false

    init() {
        checkMicrophonePermission()
    }

    func checkMicrophonePermission() {
        permissionStatus = AVAudioSession.sharedInstance().recordPermission
    }

    func requestPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                self.checkMicrophonePermission()
            }
        }
    }

    func startRecording() {
        guard permissionStatus == .granted else {
            print("Нет доступа к микрофону")
            return
        }

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try audioSession.setActive(true)

            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            let url = getAudioFileURL()
            audioRecorder = try AVAudioRecorder(url: url, settings: settings)
            audioRecorder?.record()
            isRecording = true

            print("Запись началась")
        } catch {
            print("Ошибка при начале записи: \(error.localizedDescription)")
        }
    }

    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        deleteAudioFile()
        print("Запись завершена")
    }

    private func getAudioFileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent(fileName)
    }

    private func deleteAudioFile() {
        let fileURL = getAudioFileURL()
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("Файл удалён")
        } catch {
            print("Ошибка удаления файла: \(error.localizedDescription)")
        }
    }
}

