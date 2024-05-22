//
//  MainView.swift
//  Slider
//
//  Created by user on 18.05.2024.
//

import SwiftUI

struct MainView: View {
    @State var currentValue: Float
    @Binding var targetValue: Float
   
    @State private var showAlert = false
    
    
    private let targetV = Int.random(in: 1...100)
    
    
    var body: some View {
        let difference = abs(currentValue - Float(targetV))
        let opacity = Double(1 - min(difference / 100, 1))
        VStack {
            
            Text("Подвиньте слайдер на \(targetV)")
                
            
            HStack {
                Text("0")
                
                UISliderRepresentable(currentValue: $currentValue, targetValue: $targetValue)
                    .opacity(opacity)
                    .onChange(of: currentValue) { _, newValue in
                       currentValue = newValue
                    }
                    
                     
                //Slider(value: $value, in: 1...100, step: 1)
                
                Text("100")
                   
            }
            .padding()
            
            HStack {
                Button("Проверь меня", action: checkValue)
                    .alert("Value", isPresented: $showAlert, actions: {}) {
                        Text("Your score \(computeScore())")
                    }
            }
            
            Text("Текущее значение: \(lround(Double(computeScore())))")
            
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return Int(100 - difference)
    }
    
    
    private func checkValue() {
        showAlert.toggle()
    }
     
}




#Preview {
    MainView(currentValue: 70, targetValue: .constant(90))
}
