//
//  BaseViewModel.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var anyCancellables = Set<AnyCancellable>()
    @Published var error: Error?
}
