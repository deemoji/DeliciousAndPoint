//
//  CategoriesViewModel.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation
import Combine
final class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    
    private unowned let coordinator: Coordinator
    
    fileprivate var subscription: AnyCancellable?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func fetchCategories() {
        self.subscription = RestaurantNetworkProvider.fetchCategories().sink { [weak self] completion in
            switch completion {
            case .finished:
                break
            case.failure(let error):
                print(error.localizedDescription)
            }
            self?.subscription?.cancel()
        } receiveValue: { [weak self] categories in
            self?.categories = categories
            self?.subscription?.cancel()
        }
        
        
    }
    
    func navigateToDishesView(categoryName: String) {
        coordinator.navigateToDishesView(categoryName: categoryName)
    }
    
    
}
