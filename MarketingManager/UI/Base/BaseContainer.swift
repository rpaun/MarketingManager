//
//  BaseScreen.swift
//  MarketingManager
//
//  Created by Radu Paun on 05.09.2024.
//

import SwiftUI

struct BaseContainer<Content: View>: View {
    var screenTitle: String
    var content: () -> Content
    var body: some View {
        NavigationView(content: {
            VStack {
                ScreenTitle(title: screenTitle)
                content()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.bg)
        })
        .navigationBarBackButtonHidden()
    }
}

