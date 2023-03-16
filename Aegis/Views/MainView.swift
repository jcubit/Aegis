//
//  MainView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel: MainViewModel

    var body: some View {
        Group {
            switch viewModel.stateMachine.state {
                case .loading:
                    ProgressView()
                case .loaded, .empty:
                    TabView {
                        HeroCatalogView(viewModel: viewModel.catalogViewModel)
                            .tabItem {
                                Label("Catalog", systemImage: "list.bullet.circle")
                            }.accessibilityIdentifier("CatalogTab")
                        SettingsView(filterMode: viewModel.filterMode)
                            .tabItem {
                                Label("Settings", systemImage: "gearshape.fill")
                                    .accessibilityIdentifier("SettingsButton")
                            }.accessibilityIdentifier("SettingsTab")
                    }
                    .task {
                        await viewModel.initialize()
                    }
                    .refreshable {
                        await viewModel.update()
                    }
                case .error(let error):
                    RetryView(fireUpdate: $viewModel.fireUpdate,
                              error: error)
            }
        }

    }
}

