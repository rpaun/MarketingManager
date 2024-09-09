//
//  Extensions.swift
//  MarketingManager
//
//  Created by Radu Paun on 09.09.2024.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
