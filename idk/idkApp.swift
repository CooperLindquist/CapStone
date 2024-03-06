//
//  idkApp.swift
//  idk
//
//  Created by 90310805 on 3/6/24.
//

import SwiftUI

@main
struct idkApp: App {
    @StateObject private var viewModel = ViewModel(service: AppService())
    var body: some Scene {
        WindowGroup {
            Start()
                .environmentObject(viewModel)
        }
    }
}
