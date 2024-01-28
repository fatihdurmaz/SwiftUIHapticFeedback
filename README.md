# SwiftUI Haptic Feedbacks

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS17%20-red.svg)
![Platform](https://img.shields.io/badge/Platform-WatchOs10%20-red.svg)
![Platform](https://img.shields.io/badge/SwiftUI-4-green.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

## Haptic Feedbacks
iOS 17 ile birlikte kullanıcılarla etkileşimde bulunmak için daha önce kullandığımız UIFeedbackGenerator sınıfına ihtiyacımız kalmadı.
Sensory Feedback ile kullanıcılara, SwiftUI componentleri ile etkileşime girmesini ve geri bildirimde bulunmasını sağlayabiliriz.

Bu proje, iOS uygulamalarında haptic feedbacklerin kolayca entegre edilmesini sağlar. Haptic feedbackler, kullanıcı deneyimini zenginleştiren ve etkileşimleri daha duyarlı hale getiren önemli bir özelliktir. Bu kütüphane, çeşitli haptic feedback türlerini destekler ve geliştiricilere haptic geri bildirimlerin uygulanmasını kolaylaştırır.

## .sensoryFeedback (SwiftUI Yerel Desteğiyle)
Kullanıcılara dokunsal geri bildirim sağlamak için kullanılan bir modifikatördür. Bu geri bildirim, kullanıcıların bir işlemin tamamlandığını, bir seçimin yapıldığını veya bir eylemin başarılı veya başarısız olduğunu anlamalarına yardımcı olabilir. UIKit ihtiyacını ortadan kaldırarak native component desteği sağlanmıştır (iOS 17 ve üstü sürümlerde çalışır 😞).

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

## UIFeedbackGenerator (UIKit Kullanarak)
UIKit bileşenlerinden; iOS platformunda geri bildirim oluşturmak için kullanılan bir sınıftır. Üç farklı alt sınıfa sahiptir ve her biri belirli bir geri bildirim türünü temsil eder.

### UIImpactFeedbackGenerator
Bu sınıf, kullanıcıya bir fiziksel etki gerçekleşmiş gibi bir geri bildirim sağlar. 
```swift
UIImpactFeedbackGenerator(style: .light).impactOccurred()
UIImpactFeedbackGenerator(style: .medium).impactOccurred()
UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
```
### UINotificationFeedbackGenerator
Bu sınıf, kullanıcıya bir bildirim veya uyarı olduğunu bildiren geri bildirimler sağlar. 
```swift
UINotificationFeedbackGenerator().notificationOccurred(.success)
UINotificationFeedbackGenerator().notificationOccurred(.warning)
UINotificationFeedbackGenerator().notificationOccurred(.error)
```
### UISelectionFeedbackGenerator
Bu sınıf, kullanıcı arayüzünde bir seçim yapıldığında geri bildirim sağlar. 
```swift
Toggle("Toogle", isOn: $isOn)
  .onChange(of: isOn) {
      UISelectionFeedbackGenerator().selectionChanged()
}
```
