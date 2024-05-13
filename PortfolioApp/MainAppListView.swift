//
//  MainAppListView.swift
//  PortfolioApp
//
//  Created by Adriano Valumin on 13/05/24.
//

import SwiftUI

struct MainAppListView: View {
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    Section {
                        NavigationLink("Login Screen", destination: LoginScreenView())
                    } header: {
                        Text("UI Views")
                    }
                    footer: {
                        Text("Testing creating UI View using SwiftUI. No functionality were built for now.")
                    }

                    Section {
                        Text("To be developed")
                    } header: {
                        Text("Functionalities")
                    } footer: {
                        Text("This section will be updated as functionalities are developed.")
                    }
                }
            }
            .navigationTitle("Main App List")
        }
    }
}

#Preview {
    MainAppListView()
}
