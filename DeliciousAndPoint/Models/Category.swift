//
//  Category.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation

struct CategoriesResponce: Codable {
    let сategories: [Category]
}
struct Category: Codable, Identifiable {
    
    let id: Int
    
    let name: String
    
    let image_url: String
    
}
