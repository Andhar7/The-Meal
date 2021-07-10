//
//  MealData.swift
//  challenge
//
//  Created by Andrej Kling on 10.07.21.
//

import SwiftUI

class MealData : ObservableObject {
    
    @Published var data : [Meal] = load("data.json")
    
    @Published var swipeHeight: CGFloat = 0.0
    
    @Published var select  : [Meal] = load("data.json")
    
    var currentRecipeIndex = 0
    
   func swipeEnded(value: CGFloat) {
       
        if value/3 > 20 || value/3 < -20 {
            
            var isChanged = false
            if swipeHeight > 0 {
                if currentRecipeIndex > 0 {
                    currentRecipeIndex -= 1
                    swipeHeight = 360.0
                    isChanged = true
                }
            } else if swipeHeight < 0 {
                if currentRecipeIndex < data.count - 1 {
                    currentRecipeIndex += 1
                    swipeHeight = -360.0
                    isChanged = true
                }
            }
            
            if isChanged {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.swipeHeight = 0.0
                }
            } else {
                swipeHeight = 0.0
            }
        } else {
            swipeHeight = 0.0
        }
    }
     
    func chageSwipeValue(value: CGFloat) {
        swipeHeight = value/3
    }
    
    func getCurrentRecipe() -> Meal {
        return data[currentRecipeIndex]
    }
}
