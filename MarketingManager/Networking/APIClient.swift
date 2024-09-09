//
//  NetworkManager.swift
//  MarketingManager
//
//  Created by Radu Paun on 26.08.2024.
//

import Alamofire

protocol APIClient {
    var baseURL: String { get }
    var session: Session { get }
    
    func request<T: Codable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

struct ResponseWrapper<T: Codable>: Codable {
    let record: T
    let metadata: Metadata
}

struct Metadata: Codable {
    let id: String
    let `private`: Bool
    let createdAt: String
    let name: String
}

extension APIClient {
    
    func request<T: Codable>(
        endpoint: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = baseURL + endpoint
        
        session.request(url,
                        method: method,
                        parameters: parameters,
                        encoding: URLEncoding.default,
                        headers: headers)
            .validate()
            .responseDecodable(of: ResponseWrapper<T>.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value.record))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
