//
//  PlatformChooseScreenViewModel.swift
//  MarketingManager
//
//  Created by Radu Paun on 09.09.2024.
//

import Foundation

class PlatformChooseScreenViewModel: ObservableObject {
    @Published var plans: [Plan] = []
    @Published var platforms: [Platform]
    
    init(platforms: [Platform]) {
        self.platforms = platforms
        getPlans()
    }
    
    private func getPlans() {
        Service.default.getPlans { [weak self] result in
            switch result {
            case .success(let plans):
                self?.plans = plans
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func planFor(platform: Platform) -> Plan? {
        guard let plan = plans.filter({$0.platform == platform}).sorted(by: {$0.price < $1.price}).first else { return nil }
        return plan
    }
    
    func plansFor(platform: Platform) -> [Plan] {
        plans.filter({$0.platform == platform}).sorted(by: {$0.price < $1.price})
    }
}
