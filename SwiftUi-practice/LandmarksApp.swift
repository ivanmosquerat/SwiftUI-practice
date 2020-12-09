//
//  LandmarksApp.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 10/12/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(modelData)
        }
    }
}


