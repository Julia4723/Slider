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
    
    @State var targetV = Float(Int.random(in: 1...100))
    
    var body: some View {
       let difference = abs(currentValue - targetValue)
       let opacity = 1 - min(difference / 100, 1)
        
        VStack {
            
            Text("Переместите слайдер на \(lround(Double(targetV)))")
                
            
            HStack {
                Text("0")
                
                UISliderRepresentable(currentValue: $currentValue, targetValue: $targetValue)
                
                    .opacity(Double(opacity))
                    .onChange(of: currentValue) { _, newValue in
                       currentValue = newValue
                    }
                    
                     
                //Slider(value: $value, in: 1...100, step: 1)
                
                Text("100")
                   
            }
            .padding()
            
            VStack {
                Button("Проверь меня", action: checkValue)
                    .alert("Value", isPresented: $showAlert, actions: {}) {
                        Text("Your score \(computeScore())")
                    }
                    .padding()
                Button("Начать заново", action: resetGame)
            }
            
           // Text("Текущее значение: \(computeScore())")
            
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return Int(100 - difference)
    }

    func resetGame() {
        targetV = Float(Int.random(in: 1...100))
        currentValue = 0
        }
    
    
    private func checkValue() {
        showAlert.toggle()
    }
     
}




#Preview {
    MainView(currentValue: 20, targetValue: .constant(90))
}
