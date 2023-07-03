//
//  Coordinator.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 29.06.2023.
//

import Combine
import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var categoriesViewModel: CategoriesViewModel!
    @Published var dishesViewModel: DishesViewModel?
    @Published var descriptionViewModel: DescriptionViewModel?
    @Published var cartViewModel: CartViewModel!
    
    init() {
        categoriesViewModel = CategoriesViewModel(coordinator: self)
        cartViewModel = CartViewModel(self)
    }
    
    func navigateToDishesView(categoryName: String) {
        dishesViewModel = DishesViewModel(self, categoryName: categoryName)
    }
    
    func open(_ dish: Dish) {
        descriptionViewModel = DescriptionViewModel(self, dish: dish)
    }
    
    func sendDishToCart(_ dish: Dish) {
        cartViewModel.addOrder(with: dish)
    }
    
    func toCategoriesView() {
        self.dishesViewModel = nil
    }
    func closeDescription() {
        self.descriptionViewModel = nil
    }
}
