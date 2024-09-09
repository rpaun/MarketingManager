//
//  ScreenTitle.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import SwiftUI

struct ScreenTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 38).bold())
            .foregroundStyle(.customPink)
            .padding()
    }
}

#Preview {
    ScreenTitle(title: "some")
}
