//
//  RestaurantRouter.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation

enum RestaurantRouter {
    case categories
    case dishes
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    var endpoint: String {
        "https://run.mocky.io/v3"
    }
    var path: String {
        switch self {
        case .categories:
            return "058729bd-1402-4578-88de-265481fd7d54"
        case.dishes:
            return "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
        }
    }
}
