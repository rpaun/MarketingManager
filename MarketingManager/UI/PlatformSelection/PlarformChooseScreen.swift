//
//  PlarformChooseView.swift
//  MarketingManager
//
//  Created by Radu Paun on 27.08.2024.
//

import Foundation
import SwiftUI

struct PlatformChooseScreen: View {
    @StateObject var viewModel: PlatformChooseScreenViewModel
    @State var selectedPlatform: Platform? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var environmentViewModel: EnvironmentViewModel
    
    var body: some View {
        BaseContainer(screenTitle: "screen.platforms.title".localize()) {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 24) {
                            ForEach(viewModel.platforms, id: \.id) { platform in
                                if let plan = viewModel.planFor(platform: platform) {
                                    PlatformChooseView(platform: platform, plan: plan, isSelected: platform == selectedPlatform) { platform in
                                        selectedPlatform = selectedPlatform == platform ? nil : platform
                                        environmentViewModel.selectedPlatform = selectedPlatform
                                    }
                                            .frame(maxHeight: .infinity)
                                            .frame(width: 300)
                                            .cornerRadius(20)
                                            .padding(.vertical)
                                }
                            }
                        }.scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding(.horizontal, 40)
                    .scrollIndicators(.hidden)
                    
                    if let selectedPlatform {
                        NavigationLink {
                            PlatformPlansScreen(viewModel: PlatformPlansScreenViewModel(platform: selectedPlatform,
                                                                                        plans: viewModel.plansFor(platform: selectedPlatform)))
                                .environment(environmentViewModel)
                        } label: {
                            BottomButtonView(text: "Explore more plans")
                        }
                    } else {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            BottomButtonView(text: "Nothing for you?\nGo back to targets selection",
                                             bgColor: .purple)
                        })
                    }
                }
            }
    }
}

#Preview {
    PlatformChooseScreen(viewModel: PlatformChooseScreenViewModel(platforms: []), selectedPlatform: Platform(id: 0, name: ""))
}
