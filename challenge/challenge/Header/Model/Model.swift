//
//  Model.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI
import Foundation

struct Meal: Codable, Identifiable, Hashable {
    
    let title: String
    let description: String
    let imageName: String
    let steps: [String]
    let ingredients: [String]
    let id: Int
    let isFeatured: Bool
    let isFavorite: Bool
    let imageSystem: [String]
    let sum : [String]
    let price : Int
    
}
