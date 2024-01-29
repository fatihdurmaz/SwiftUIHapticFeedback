# SwiftUI Haptic Feedbacks

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS17%20-red.svg)
![Platform](https://img.shields.io/badge/Platform-WatchOs10%20-red.svg)
![Platform](https://img.shields.io/badge/SwiftUI-4-green.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

[<img src="https://yourimageshare.com/ib/5NduZtgpQQ.webp">](https://www.youtube.com/watch?v=81q0mCOHyrM "SwiftUI Haptic Feedbacks")

With iOS 17, we no longer need the UIFeedbackGenerator class we previously used to interact with users.
We can enable users to interact with SwiftUI components and provide feedback using .sensoryFeedback.

## About
This project enables easy integration of haptic feedback in iOS applications. Haptic feedback is an important feature that enriches the user experience and makes interactions more responsive. This library supports various types of haptic feedback and simplifies the implementation of haptic feedback for developers.

## .sensoryFeedback (Use SwiftUI)
This is a modifier used to provide users with tactile feedback. This feedback can help users understand when an action is completed, a selection is made, or an action succeeds or fails. Native component support is provided by eliminating the need for UIKit (works on iOS 17 and above 😞).

```swift
    @State private var isOn = false
    @State var stepperValue: Int = 50
    @State private var completeWarning = false
    @State private var impactLight = false

    Button("Light") {
        impactLight.toggle()
    }
    .buttonStyle(.borderedProminent)
    .sensoryFeedback(.impact(weight: .light), trigger: impactLight)

    Button("Error") {
        completeError.toggle()
    }
    .buttonStyle(.borderedProminent)
    .tint(.red)
    .sensoryFeedback(.start, trigger: completeWarning)

    Toggle("Toogle", isOn: $isOn)
        .sensoryFeedback(.selection, trigger: isOn)
    
    Stepper("Stepper \(stepperValue)", value: $stepperValue, in: 1...100, step: 1)
        .sensoryFeedback(trigger: stepperValue){oldValue, newValue in
            return oldValue < newValue ? .increase : .decrease
}
```

## UIFeedbackGenerator (Use UIKit)
It is a class used to generate feedback on the iOS platform from UIKit components. It has three different subclasses, each representing a specific type of feedback.

### UIImpactFeedbackGenerator
This class provides the user with feedback as if a physical impact has occurred.

```swift
    UIImpactFeedbackGenerator(style: .light).impactOccurred()
    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
```
### UINotificationFeedbackGenerator
This class provides feedback to the user indicating that there is a notification or alert.

```swift
    UINotificationFeedbackGenerator().notificationOccurred(.success)
    UINotificationFeedbackGenerator().notificationOccurred(.warning)
    UINotificationFeedbackGenerator().notificationOccurred(.error)
```
### UISelectionFeedbackGenerator
This class provides feedback when a selection is made in the user interface.

```swift
    Toggle("Toogle", isOn: $isOn)
      .onChange(of: isOn) {
          UISelectionFeedbackGenerator().selectionChanged()
    }
```
