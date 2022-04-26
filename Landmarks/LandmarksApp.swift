//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    // MARK: Private Properties
    
    @StateObject private var modelData = ModelData()
    
    // MARK: Public Properties
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}

// MARK: Global constants
let isMacOS = DeviceInfo().systemPlatform == .macOS
