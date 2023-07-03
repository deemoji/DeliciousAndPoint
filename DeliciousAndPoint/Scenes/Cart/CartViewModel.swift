//
//  CartViewModel.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 01.07.2023.
//

import Foundation

final class CartViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    @Published var cartItems: [Int: Int] = [:]
    
    private unowned let coordinator: Coordinator
    
    init(_ coordinator: Coordinator){
        self.coordinator = coordinator
    }
    
    func addOrder(with dish: Dish) {
        if !dishes.contains(where: {
            dish.id == $0.id
        }) {
            dishes.append(dish)
        }
        cartItems[dish.id, default: 0] += 1
    }
}
