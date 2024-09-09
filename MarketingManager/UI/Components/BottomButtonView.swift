//
//  BottomButton.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import SwiftUI

struct BottomButtonView: View {
    var text: String
    var bgColor: Color = .customPink
    
    var body: some View {
        Text(text)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .foregroundStyle(.white)
            .bold()
            .cornerRadius(8)
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
    }
}

#Preview {
    BottomButtonView(text: "Example", bgColor: .pink)
}
