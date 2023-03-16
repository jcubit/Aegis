//
//  MainViewModel.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation
import HeroDomain
import SwiftUI

/// `MainViewModel` does the presentation logic
@MainActor
final class MainViewModel: ObservableObject {

    private let heroService: HeroService

    @Published var catalogViewModel = CatalogViewModel()
    @Published var filterMode = FilterMode()

    var stateMachine = StateMachine()
    @Published var fireUpdate = false {
        didSet {
            Task {
                await update()
            }
        }
    }

    init(heroService: HeroService) {
        self.heroService = heroService
    }

    func initialize() async {
        do {
            try stateMachine.load()
            let heroes = try await heroService.fetchHeroes()
            try stateMachine.receiveHeroes()
            let catalogViewModel = CatalogViewModel(featuredHeroes: heroes)
            self.catalogViewModel = catalogViewModel
        } catch {
            stateMachine.handle(error: error)
            // trigger MainView to reload
            self.catalogViewModel = CatalogViewModel(featuredHeroes: [])
        }
    }

    func update() async {
        do {
            try stateMachine.load()
            var heroes = try await heroService.fetchHeroes()
            try stateMachine.receiveHeroes()

            if let attribute = filterMode.attribute {
                heroes = heroes.filter({ $0.primaryAttribute == attribute })
            }
            if let attack = filterMode.attack {
                heroes = heroes.filter({ $0.attackType == attack })
            }
            if let role = filterMode.role {
                heroes = heroes.filter({ $0.roles.contains(role) })
            }
            let catalogViewModel = CatalogViewModel(featuredHeroes: heroes)
            self.catalogViewModel = catalogViewModel
        } catch {
            stateMachine.handle(error: error)
        }
    }

}

extension MainViewModel {
    final class FilterMode: ObservableObject {
        @Published var attribute: Hero.Attribute?
        @Published var attack: Hero.Attack?
        @Published var role: Hero.Role?
    }
}
