//
//  SensoryFeeback.swift
//  SwiftUIHapticFeedback
//
//  Created by Fatih Durmaz on 27.01.2024.
//

import SwiftUI

struct SensoryFeedbackView: View {
    
    @State private var isOn = false
    @State var stepperValue: Int = 50
    
    @State private var completeSuccess = false
    @State private var completeWarning = false
    @State private var completeError = false
    
    @State private var impactLight = false
    @State private var impactMedium = false
    @State private var impactHeavy = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    
                    Section("") {
                        Button("Light") {
                            impactLight.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .sensoryFeedback(.impact(weight: .light), trigger: impactLight)
                        
                        Button("Medium") {
                            impactMedium.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .sensoryFeedback(.impact(weight: .medium), trigger: impactLight)
                        
                        
                        Button("Heavy") {
                            impactHeavy.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .sensoryFeedback(.impact(weight: .heavy), trigger: impactLight)
                        
                    }
                    
                    Section("") {
                        Button("Success") {
                            completeSuccess.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .sensoryFeedback(.start, trigger: completeSuccess)
                        
                        Button("Warning") {
                            completeWarning.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .sensoryFeedback(.start, trigger: completeWarning)

                        
                        
                        Button("Error") {
                            completeError.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .sensoryFeedback(.start, trigger: completeWarning)

                    }
                    
                    Section {
                        Toggle("Toogle", isOn: $isOn)
                            .sensoryFeedback(.selection, trigger: isOn)
                        
                        Stepper("Stepper \(stepperValue)", value: $stepperValue, in: 1...100, step: 1)
                            .sensoryFeedback(trigger: stepperValue){oldValue, newValue in
                                return oldValue < newValue ? .increase : .decrease
                            }
                        
                        
                        
                    } header: {
                        Text("")
                    }
                }
            }
            .navigationTitle("Haptic Feedbacks")
        }
    }
}

#Preview {
    SensoryFeedbackView()
}
