//
//  TargetSpecificsViewModel.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import Foundation

class TargetSpecificsViewModel: BaseViewModel {
    @Published var targetSpecifics: Array<TargetSpecific> = []
    @Published var selectedTargetSpecifics: Set<TargetSpecific> = []
    @Published var availablePlatforms: Set<Platform> = []
    @Published var isAvailablePlatformsEmpty: Bool = true
    
    override init() {
        super.init()
        observeAvailablePlatforms()
        getTargetSpecifics()
    }
    
    func getTargetSpecifics() {
        Service.default.getTargetSpecifics { [weak self] result in
            switch result {
            case .success(let targetSpecifics):
                self?.targetSpecifics = targetSpecifics
            case .failure(let error):
                self?.error = error
                print(error)
            }
        }
    }
    
    func targetSpecificSelected(target: TargetSpecific) {
        if selectedTargetSpecifics.contains(target) {
            selectedTargetSpecifics.remove(target)
        } else {
            selectedTargetSpecifics.insert(target)
        }
        
        availablePlatforms = []
        selectedTargetSpecifics.forEach { targetSpecific in
            if availablePlatforms.isEmpty {
                availablePlatforms.formUnion(targetSpecific.supportedBy)
                availablePlatforms = Set<Platform>(availablePlatforms.sorted { $0.id < $1.id })
            } else {
                availablePlatforms.formIntersection(targetSpecific.supportedBy)
                availablePlatforms = Set<Platform>(availablePlatforms.sorted { $0.id < $1.id })
            }
        }
    }
    
    private func observeAvailablePlatforms() {
        $availablePlatforms.sink { [weak self] platforms in
            self?.isAvailablePlatformsEmpty = platforms.isEmpty
        }.store(in: &anyCancellables)
    }
}
