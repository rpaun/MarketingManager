//
//  TargetSpecificView.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import Foundation
import SwiftUI

struct TargetingSpecificsView: View {
    var targetSpecific: TargetSpecific
    var isSelected = false
    var action: (TargetSpecific) -> ()
    
    var body: some View {
        ZStack {
            if isSelected {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.customPink)
                    }
                    Spacer()
                }
                .padding([.trailing, .top], 12)
            }
            
            VStack(content: {
                Text(targetSpecific.name)
                    .font(.system(size: 16).bold())
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(isSelected ? .customPink : .white)
                    .padding(.top, 24)
                Spacer()
                    HStack {
                        ForEach(targetSpecific.supportedBy) { platform in
                            PlatformLogo(platform: platform)
                                .frame(width: 18, height: 18)
                        }
                    }
                    .padding(.bottom, 12)
            })
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .scaleEffect(isSelected ? CGSize(width: 1.02, height: 1.02) : CGSize(width: 1, height: 1))
        .background(.cardBg)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? .customPink : .cardBg, lineWidth: 0.5)
        )
        .onTapGesture {
            action(targetSpecific)
        }
    }
}
