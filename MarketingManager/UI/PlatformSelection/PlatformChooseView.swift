//
//  PlatformChooseView.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import SwiftUI


struct PlatformChooseView: View {
    var platform: Platform
    var plan: Plan
    var isSelected: Bool = false
    var action: (Platform) -> ()
    var body: some View {
        VStack {
            PlatformLogo(platform: platform)
                .frame(width: 100, height: 100)
                .padding(32)
            Text(platform.name)
                .foregroundStyle(.white)
                .font(.system(size: 42, weight: .bold))
            
            VStack {
                Text("Starting from \(plan.price)\(plan.currency)")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                ForEach(plan.features, id: \.key) { feature in
                    Text(feature.name)
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                Text("Many more..")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 24)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(isSelected ? .customPink : .cardBg)
        .onTapGesture {
            action(platform)
        }
    }
}
