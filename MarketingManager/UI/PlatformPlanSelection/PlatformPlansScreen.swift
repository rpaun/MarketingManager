//
//  PlatformPlansView.swift
//  MarketingManager
//
//  Created by Radu Paun on 05.09.2024.
//

import Foundation
import SwiftUI



struct PlatformPlansScreen: View {
    var viewModel: PlatformPlansScreenViewModel
    @State var selectedPlan: Plan?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var environmentViewModel: EnvironmentViewModel
    
    var body: some View {
            BaseContainer(screenTitle: "screen.plans.title".localize()) {
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.plans) { plan in
                                PlatformPlanView(plan: plan, isSelected: selectedPlan == plan)
                                    .frame(maxHeight: .infinity)
                                    .onTapGesture {
                                        selectedPlan = selectedPlan == plan ? nil : plan
                                        environmentViewModel.selectedPlan = selectedPlan
                                    }
                            }
                        }
                        .padding(.vertical, 60)
                        .padding(.horizontal, 32)
                    }.scrollIndicators(.hidden)
                    
                    if selectedPlan == nil {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            BottomButtonView(text: "Go back to platform selection", bgColor: .purple)
                        })
                    } else {
                        NavigationLink {
                            ReviewScreen().environment(environmentViewModel)
                        } label: {
                            BottomButtonView(text: "Proceed and review your selection")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}

//#Preview {
//    PlatformPlansScreen(viewModel: PlatformPlansScreenViewModel(platform: Platform(id: 3, name: "")), selectedPlan: nil )
//}
