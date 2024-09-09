//
//  ContentView.swift
//  MarketingManager
//
//  Created by Radu Paun on 26.08.2024.
//

import SwiftUI

struct TargetSpecificsScreen: View {
    
    @StateObject var viewModel = TargetSpecificsViewModel()
    @StateObject var environmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        BaseContainer(screenTitle: "screen.targets.title".localize()) {
                VStack {
                    
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.clockwise")
                        Text("Reset")
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        viewModel.selectedTargetSpecifics = []
                    }
                    .opacity(viewModel.selectedTargetSpecifics.isEmpty ? 0 : 1)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.selectedTargetSpecifics)
                    
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 10, maximum: .infinity)),
                            GridItem(.flexible(minimum: 10, maximum: .infinity))], content: {
                            ForEach(viewModel.targetSpecifics, id: \.key) { element in
                                TargetingSpecificsView(targetSpecific: element, isSelected: viewModel.selectedTargetSpecifics.contains(element)) { target in
                                    viewModel.targetSpecificSelected(target: target)
                                    environmentViewModel.selectedTargets = Array(viewModel.selectedTargetSpecifics)
                                }
                            }
                        })
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                    }
                    
                    if !viewModel.selectedTargetSpecifics.isEmpty {
                        NavigationLink(destination: 
                                        PlatformChooseScreen(
                                            viewModel: PlatformChooseScreenViewModel.init(
                                                platforms: Array(viewModel.availablePlatforms)))
                                            .environment(environmentViewModel)) {
                            ZStack {
                                VStack {
                                    Text("Next")
                                        .font(.system(size: 24).bold())
                                }
                                VStack {
                                    Spacer()
                                    HStack(spacing: 12) {
                                        ForEach(Array(viewModel.availablePlatforms)) { platform in
                                            PlatformLogo(platform: platform)
                                                .frame(width: 10, height: 10)
                                        }
                                    }
                                    .padding(.bottom, 4)
                                }
                                .padding(.bottom, 4)
                            }
                            .frame(height: 72)
                            .frame(maxWidth: .infinity)
                            .background(viewModel.isAvailablePlatformsEmpty ? .gray : .customPink)
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                        }
                        .disabled(viewModel.isAvailablePlatformsEmpty)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    TargetSpecificsScreen()
}
