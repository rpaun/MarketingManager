//
//  EnvironmentViewModel.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import Foundation

class EnvironmentViewModel: ObservableObject, Observable {
    var selectedTargets: [TargetSpecific] = []
    var selectedPlatform: Platform?
    var selectedPlan: Plan?
}
