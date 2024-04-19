//
//  DemoProjectApp.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

@main
struct DemoProjectApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { (oldScenePhase, newScenePhase) in
            switch newScenePhase {
            case .active:
                print("Active \(oldScenePhase)")
            case .inactive:
                print("Inctive \(oldScenePhase)")
            case .background:
                print("Background")
            default:
                print("Unknown scenephase")
            }
        }
    }
}
