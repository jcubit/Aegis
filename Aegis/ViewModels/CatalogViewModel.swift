//
//  CatalogViewModel.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation
import HeroDomain

@MainActor
final class CatalogViewModel: ObservableObject {
    @Published var featuredHeroes: [Hero]

    init(featuredHeroes: [Hero] = []) {
        self.featuredHeroes = featuredHeroes
    }
}
