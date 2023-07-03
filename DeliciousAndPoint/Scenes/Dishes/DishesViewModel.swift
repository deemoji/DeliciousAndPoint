//
//  DishesViewModel.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Combine

final class DishesViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    
    var categoryName: String
    
    var subscriber: AnyCancellable?
    
    private unowned let coordinator: Coordinator
    
    init(_ coordinator: Coordinator, categoryName: String) {
        self.coordinator = coordinator
        self.categoryName = categoryName
    }
    
    func open(_ dish: Dish) {
        self.coordinator.open(dish)
    }
    
    func fetchDishes() {
        subscriber = RestaurantNetworkProvider.fetchDishes().sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
            self?.subscriber?.cancel()
        }, receiveValue: { [weak self] dishes in
            self?.dishes = dishes
            self?.subscriber?.cancel()
        })
    }
}
