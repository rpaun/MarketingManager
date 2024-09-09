//
//  TargetingSpecifics.swift
//  MarketingManager
//
//  Created by Radu Paun on 26.08.2024.
//

import Foundation

struct TargetSpecific: Hashable, Codable {
    let key: String
    let name: String
    let supportedBy: [Platform]
    
    static func == (lhs: TargetSpecific, rhs: TargetSpecific) -> Bool {
        lhs.key == rhs.key
    }
}

struct Platform: Hashable, Identifiable, Codable {
    let id: Int
    let name: String
    
    static func ==(lhs: Platform, rhs: Platform) -> Bool {
        lhs.id == rhs.id
    }
}

class Plan: Identifiable, Equatable, Codable {
    static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let price: Int
    let currency: String
    let platform: Platform
    let listings: [Int]
    let optimisations: Int?
    var features: [Feature]
    
    init(id: Int,
         price: Int,
         currency: String,
         platform: Platform,
         listings: [Int],
         optimisations: Int?,
         features: [Feature]) {
        self.id = id
        self.price = price
        self.currency = currency
        self.platform = platform
        self.listings = listings
        self.optimisations = optimisations
        self.features = features
        
        createOptimisationsFeature()
        createListingFeature()
    }
    
    func createOptimisationsFeature() {
        if let optimisations, optimisations != 0 {
            features.insert(Feature(name: "\(optimisations) optimisations", key: "feature.\(optimisations).optimisations"), at: 0)
        }
    }
    
    func createListingFeature() {
        if !listings.isEmpty {
            let sorted = listings.sorted(by: { $0 < $1 })
            if listings.count == 1 && listings[0] == 1 {
                features.insert(Feature(name: "1 listing", key: "feature.1.listings"), at: 0)
                return
            }
            let stringValues = sorted.map { String($0) }
            
            return features.insert(Feature(name: "\(stringValues.joined(separator: "-")) listings", key: "feature.\(sorted.description).listings"), at: 0)
        }
    }
}

struct Feature: Codable {
    let name: String
    let key: String
}
