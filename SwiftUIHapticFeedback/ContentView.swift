//
//  ContentView.swift
//  SwiftUIHapticFeedback
//
//  Created by Fatih Durmaz on 26.01.2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var isOn = false
    @State var sliderValue: Double = 50
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section{
                        Button("Light") {
                            
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Medium") {
                            
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            AudioServicesPlaySystemSound(1015)
                            
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Heavy") {
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()

                            
                        }
                        .buttonStyle(.borderedProminent)
                        
                    } header: {
                        Text("UIImpactFeedbackGenerator")
                    }
                    
                    Section{
                        Button("Success") {
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        
                        Button("Warning") {
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        
                        Button("Error") {
                            UINotificationFeedbackGenerator().notificationOccurred(.error)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        
                    } header: {
                        Text("UINotificationFeedbackGenerator")
                    }
                    
                    Section {
                        Toggle("Toogle", isOn: $isOn)
                            .onChange(of: isOn) {
                                UISelectionFeedbackGenerator().selectionChanged()
                            }
                        
                        
                        HStack {
                            Slider(value: $sliderValue, in: 1...100, step: 1){ _ in
                                UISelectionFeedbackGenerator().selectionChanged()
                            }
                                .padding(.trailing, 50)
                            
                            Text("Value: \(sliderValue, specifier: "%.0f")")
                                .bold()
                        }
                        
                    } header: {
                        Text("UISelectionFeedbackGenerator")
                    }
                }
            }
            .navigationTitle("Haptic Feedbacks")
        }
    }
}

#Preview {
    ContentView()
}
