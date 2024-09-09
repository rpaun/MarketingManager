//
//  PlatformPlansViewModel.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import Foundation

class PlatformPlansScreenViewModel: ObservableObject {
    var platform: Platform
    @Published var plans: [Plan] = []
    
    init(platform: Platform, plans: [Plan]) {
        self.platform = platform
        self.plans = plans
    }
}
