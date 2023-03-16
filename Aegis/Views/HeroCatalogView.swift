//
//  HeroCatalogView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain

struct HeroCatalogView: View {
    @ObservedObject private var viewModel: CatalogViewModel

    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            List(viewModel.featuredHeroes) { hero in
                NavigationLink(value: hero) {
                    HeroView(viewModel: HeroViewModel(hero: hero))
                }
            }
            .navigationDestination(for: Hero.self) { hero in
                HeroDetailView(viewModel: HeroDetailViewModel(hero: hero))
            }
            .navigationTitle("Dota 2 Heroes")
            .listStyle(.plain)

        }
        .accessibilityIdentifier("HeroCatalogView")
    }
}
