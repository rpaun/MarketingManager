//
//  Client.swift
//  MarketingManager
//
//  Created by Radu Paun on 26.08.2024.
//

import Foundation
import Alamofire

enum ClientEndpoint: String {
    case plans = "/b/66dde45bad19ca34f8a1d99a"
    case targetSpecifics = "/b/66dde16aad19ca34f8a1d846"
    case platfroms = "/b/66d98c65e41b4d34e42a9530"
}

class Client: APIClient {    
    var baseURL: String = "https://api.jsonbin.io/v3"
    var session: Session = .default
    
    private let headers: HTTPHeaders = .init([
        HTTPHeader(name: "X-Master-Key", value: "$2a$10$cCeRvRrsrDFykonWra.L9.444HSkKvrdOvpI6TAosbfs0jpi4j8AC"),
        HTTPHeader(name: "X-Access-Key", value: "$2a$10$IHviyBldvin54GS3jbhprOxbRPGXom0qmCc/NargXjECYuzbHz7U.")
    ])
    
    static let `default` = Client()
    
    private init() {}
    
    func request<T: Codable>(
        endpoint: ClientEndpoint,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        request(endpoint: endpoint.rawValue,
                method: method,
                parameters: parameters,
                headers: headers,
                completion: completion)
    }
}
