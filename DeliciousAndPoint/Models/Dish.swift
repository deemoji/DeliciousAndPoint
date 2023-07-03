//
//  Dish.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation


struct DishesResponce: Codable {
    let dishes: [Dish]
}
struct Dish: Codable, Identifiable, Hashable {
    
    let id: Int
    
    let name: String
    
    let price: Int
    
    let weight: Int
    
    let description: String
    
    let image_url: String
    
    let tegs: [String]
    
}
