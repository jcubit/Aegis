//
//  ThrowingHeroLoader.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import HeroDomain
import Foundation

final class ThrowingHeroLoader: HeroService {
    private var throwingToggle = true
    private let heroLoader = HeroLoaderMock()

    func fetchHeroes() async throws -> [Hero] {
        if throwingToggle {
            throwingToggle.toggle()
            throw FetchErrors.invalidServerResponse
        } else {
            return try await correctFetch()
        }
    }

    private func correctFetch() async throws -> [Hero] {
        return try await heroLoader.fetchHeroes()
    }
}

