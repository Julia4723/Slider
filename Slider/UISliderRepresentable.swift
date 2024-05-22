//
//  UISliderRepresentable.swift
//  Slider
//
//  Created by user on 18.05.2024.
//

import SwiftUI
import UIKit

struct UISliderRepresentable: UIViewRepresentable {
    
    @Binding var currentValue: Float
    @Binding var targetValue: Float
    
    
    
    //Создает элемент
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 1
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
         )
        
        return slider
    }
    
    
    //обновляет элемент
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue, targetValue: $targetValue)
    }
}


extension UISliderRepresentable {
        class Coordinator: NSObject {
            @Binding var currentValue: Float
            @Binding var targetValue: Float
           
            
            init(value: Binding<Float>, targetValue: Binding<Float>) {
                self._currentValue = value
                self._targetValue = value
                
            }
            
            @objc func sliderValueChanged(_ sender: UISlider) {
                currentValue = Float(sender.value)
                
            }
        }
    }
   

#Preview {
    UISliderRepresentable(currentValue: .constant(90), targetValue: .constant(90))
}
