//
//  ReviewScreen.swift
//  MarketingManager
//
//  Created by Radu Paun on 06.09.2024.
//

import SwiftUI

struct ReviewScreen: View {
    @EnvironmentObject var environmentViewModel: EnvironmentViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isConfirmed: Bool = false
    var body: some View {
        BaseContainer(screenTitle: "screen.review.title".localize()) {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Target specifics")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                            Spacer()
                        }
                        VStack(alignment: .leading) {
                            ForEach(environmentViewModel.selectedTargets, id: \.key) { target in
                                Text(target.name)
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                        }
                        
                        if let platform = environmentViewModel.selectedPlatform {
                            HStack {
                                Text("Platform")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .bold()
                                Spacer()
                            }
                            .padding(.top, 24)
                            HStack {
                                PlatformLogo(platform: platform)
                                    .frame(width: 16, height: 16)
                                Text(platform.name)
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                        }
                        
                        if let plan = environmentViewModel.selectedPlan {
                            HStack {
                                Text("Plan")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .bold()
                                Spacer()
                            }
                            .padding(.top, 24)
                            VStack(alignment: .leading) {
                                Text("\(plan.price)\(plan.currency)")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                ForEach(plan.features, id: \.key) { feature in
                                    Text(feature.name)
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                }
                VStack {
                    HStack {
                        Image(systemName: isConfirmed ? "checkmark.square" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                        Text("Review and confirm")
                            .foregroundStyle(.white)
                    }
                    .onTapGesture {
                        isConfirmed.toggle()
                    }
                    if isConfirmed {
                        NavigationLink {
                            BaseContainer(screenTitle: "Thanks for your purchase") {
                                VStack {
                                    Spacer()
                                    Image(systemName: "face.smiling")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .foregroundStyle(.yellow)
                                    Spacer()
                                }
                            }
                        } label: {
                            BottomButtonView(text: "Go to checkout")
                        }
                    } else {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            BottomButtonView(text: "Not satisfied?\n Go back", bgColor: .purple)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewScreen()
}
