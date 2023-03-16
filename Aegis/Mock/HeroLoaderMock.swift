//
//  HeroLoaderMock.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation
import SwiftUI
import HeroDomain

final class HeroLoaderMock: HeroService {
    func fetchHeroes() async throws -> [HeroDomain.Hero] {
        guard let defaultIcon = HeroImage(systemName: "person.circle"),
              let defaultImage = HeroImage(systemName: "person.fill")
        else { fatalError("Could not load system images") }

        guard let url = Bundle.main.url(forResource: "rawHeroes", withExtension: "json"),
              let heroes = try? JSONDecoder().decode([RawHero].self, from: Data(contentsOf: url))
        else { return [] }

        return heroes.compactMap { rawHero in Hero(rawHero, icon: defaultIcon, profileImage: defaultImage)}
    }
}

