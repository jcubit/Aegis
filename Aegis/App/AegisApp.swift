//
//  AegisApp.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain
import HeroDataAccess

/// **Composition Root**
/// Main entry point of the Application
@main
struct AegisApp: App {

    private var composer = Composer()

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: composer.root)
                .preferredColorScheme(UserDefaults.standard.bool(forKey: "darkMode") ? .dark : .light)
        }
    }
}


/// Object that composes the dependencies of the App
final class Composer {

    @MainActor
    var root: MainViewModel {
        get {
            UserDefaults.standard.bool(forKey: "runTest") ? testing : live
        }
    }

    @MainActor
    var live: MainViewModel {
        get {
            return MainViewModel(
                heroService: HeroLoader(
                    heroRepository: JSONHeroRepository(
                        baseURL: "https://cdn.dota2.com/",
                        heroesURL: "https://api.opendota.com/api/heroStats"),
                    filter: { _ in true },
                    baseURL: "https://cdn.dota2.com/"))
        }
    }

    @MainActor
    var testing: MainViewModel {
        get {
            return MainViewModel(heroService: HeroLoaderMock())
        }
    }

    @MainActor
    var throwingHeroService: MainViewModel {
        get {
            return MainViewModel(
                heroService: ThrowingHeroLoader())
        }
    }

}
