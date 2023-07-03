//
//  NetworkTests.swift
//  NetworkTests
//
//  Created by Дмитрий Мартьянов on 30.06.2023.
//

import XCTest
@testable import DeliciousAndPoint

class NetworkTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    func testURLIsOk() throws {
        
        XCTAssertEqual(RestaurantRouter.categories.urlString, "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
        XCTAssertEqual(RestaurantRouter.dishes.urlString, "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
        
    }
    func testFetchCategories() throws {
        let expectation = self.expectation(description: "Awaiting publisher")
        
        let cancellable = RestaurantNetworkProvider.fetchCategories().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
                break
            }
            expectation.fulfill()
        } receiveValue: { categories in
            XCTAssertEqual(categories.count, 4)
        }
        waitForExpectations(timeout: 10.0)
        cancellable.cancel()
    }

    func testFetchDishes() throws {
        let expectation = self.expectation(description: "Awaiting publisher")
        
        let cancellable = RestaurantNetworkProvider.fetchDishes().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
                break
            }
            
            expectation.fulfill()
        } receiveValue: { dishes in
            XCTAssertEqual(dishes.count, 12)
        }
        waitForExpectations(timeout: 10.0)
        cancellable.cancel()
    }

}
