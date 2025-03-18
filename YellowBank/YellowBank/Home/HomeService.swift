//
//  HomeService.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import Foundation

protocol HomeServicing {
    func getData(completion: @escaping (Result<HomeResponse, HomeApiError>) -> Void)
}

final class HomeService {}

// MARK: - HomeServicing
extension HomeService: HomeServicing {
    func getData(completion: @escaping (Result<HomeResponse, HomeApiError>) -> Void) {
        let JSON = getDataSource.getData()
        let jsonData = JSON.data(using: .utf8)!
        
        do {
            let homeData: HomeResponse = try JSONDecoder().decode(HomeResponse.self, from: jsonData)
            completion(.success(homeData))
        } catch {
            completion(.failure(.decodeFail))
        }
    }
}


enum HomeApiError: Error {
    case decodeFail
}
