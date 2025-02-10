//
//  ContentView.swift
//  VoiceConverter
//
//  Created by Vitalii Navrotskyi on 06.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppViewModel()

    var body: some View {
        MainView()
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
