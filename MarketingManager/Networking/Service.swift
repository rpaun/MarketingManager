//
//  Service.swift
//  MarketingManager
//
//  Created by Radu Paun on 09.09.2024.
//

import Foundation

class Service {
    static let `default` = Service()
    
    private init() {}
    
    func getPlatforms(completion: @escaping (Result<[Platform], Error>) -> ()) {
        Client.default.request(endpoint: .platfroms) { (result: Result<[Platform], Error>) in
            completion(result)
        }
    }
    
    func getTargetSpecifics(completion: @escaping (Result<[TargetSpecific], Error>) -> ()) {
        Client.default.request(endpoint: .targetSpecifics) { (result: Result<[TargetSpecific], Error>) in
            completion(result)
        }
    }
    
    func getPlans(completion: @escaping (Result<[Plan], Error>) -> ()) {
        Client.default.request(endpoint: .plans) { (result: Result<[Plan], Error>) in
            completion(result)
        }
    }
}
