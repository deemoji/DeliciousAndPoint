//
//  FetchRequest.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation
import Combine

final class RestaurantNetworkProvider {
    
    static func fetchCategories() -> AnyPublisher<[Category], Error> {
        guard let url = URL(string: RestaurantRouter.categories.urlString) else {
            return Fail<[Category], Error>(error: NetworkClient.NetworkingError.badURLResponce(url: RestaurantRouter.categories.urlString)).eraseToAnyPublisher()
        }
        return NetworkClient.instance.fetch(from: url)
            .decode(type: CategoriesResponce.self, decoder: JSONDecoder())
            .map(\.сategories)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func fetchDishes() -> AnyPublisher<[Dish], Error> {
        guard let url = URL(string: RestaurantRouter.dishes.urlString) else {
            return Fail<[Dish], Error>(error: NetworkClient.NetworkingError.badURLResponce(url: RestaurantRouter.dishes.urlString)).eraseToAnyPublisher()
        }
        return NetworkClient.instance.fetch(from: url)
            .decode(type: DishesResponce.self, decoder: JSONDecoder())
            .map(\.dishes)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
