//
//  NetworkClient.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import Foundation
import Combine

final class NetworkClient {
    enum NetworkingError: Error {
        case unknown
        case badURLResponce(url: String)
    }
    static let instance = NetworkClient()
    
    private let session: URLSession
    
    private init() {
        session = URLSession.shared
    }
    
    func fetch(from url: URL) -> AnyPublisher<Data, Error> {
        return session.dataTaskPublisher(for: url)
            .tryMap { [self] in
                try handleURLResponce(output: $0, url: url)
            }
            .eraseToAnyPublisher()
    }
    private func handleURLResponce(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let responce = output.response as? HTTPURLResponse,
              responce.statusCode >= 200 && responce.statusCode < 300 else {
            throw NetworkingError.badURLResponce(url: url.path)
        }
        return output.data
    }
}
