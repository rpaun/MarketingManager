//
//  PlatformPlanView.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import SwiftUI

struct PlatformPlanView: View {
    var plan: Plan
    var isSelected = false
    var body: some View {
        VStack {
            PlatformLogo(platform: plan.platform)
                .frame(width: 100, height: 100)
                .padding(.top, 44)
            Text("\(plan.price)\(plan.currency)")
                .foregroundStyle(.white)
                .bold()
                .padding(.top, 44)
                .font(.title)
            Spacer()
            ForEach(plan.features, id: \.key) { feature in
                Text(feature.name)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            Spacer()
        }
        .frame(width: 300)
        .background(isSelected ? .customPink : .cardBg)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
    }
}
