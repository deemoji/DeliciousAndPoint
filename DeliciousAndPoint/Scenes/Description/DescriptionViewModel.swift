//
//  DescriptionViewModel.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 01.07.2023.
//

import Foundation

final class DescriptionViewModel: ObservableObject, Identifiable {
    
    @Published var dish: Dish
    private unowned let coordinator: Coordinator

    init(_ coordinator: Coordinator, dish: Dish) {
        self.coordinator = coordinator
        self.dish = dish
    }
    func sendDishToCart(_ dish: Dish) {
        coordinator.sendDishToCart(dish)
    }
    func closeDescription() {
        self.coordinator.closeDescription()
    }
}
