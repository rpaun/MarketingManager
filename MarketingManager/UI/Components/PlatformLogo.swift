//
//  PlatformLogo.swift
//  MarketingManager
//
//  Created by Radu Paun on 05.09.2024.
//

import SwiftUI

struct PlatformLogo: View {
    var platform: Platform
    var body: some View {
        switch platform.id {
        case 0:
            Image(.logoLinkedin)
                .resizable()
        case 1:
            Image(.logoFacebook)
                .resizable()
        case 2:
            Image(.logoTwitter)
                .resizable()
        case 3:
            Image(.logoInsta)
                .resizable()
        case 4:
            Image(.logoGoogle)
                .resizable()
        default:
            Image(systemName: "s.circle")
                .resizable()
                .foregroundStyle(.white)
        }
    }
}
