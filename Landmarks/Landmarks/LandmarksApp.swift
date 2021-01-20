//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Felipe Díaz on 28/12/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
