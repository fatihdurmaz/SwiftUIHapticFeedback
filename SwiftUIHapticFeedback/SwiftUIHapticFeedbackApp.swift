//
//  SwiftUIHapticFeedbackApp.swift
//  SwiftUIHapticFeedback
//
//  Created by Fatih Durmaz on 26.01.2024.
//

import SwiftUI

@main
struct SwiftUIHapticFeedbackApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

    }
    
    @State private var selection = 0
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                ContentView()
                    .tabItem {
                        Label("UIFeedbackGenerator", systemImage: "1.circle")
                            .tag(0)
                    }
                
                SensoryFeedbackView()
                    .tabItem {
                        Label("SensoryFeedback", systemImage: "2.circle")
                            .tag(1)
                    }
            }
        }
    }
}
