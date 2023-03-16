//
//  HeroViewModel.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain

struct HeroViewModel {
    var heroName: String
    var primaryAttribute: LocalizedStringKey
    var attackType: LocalizedStringKey
    var iconImage: HeroImage

    init(hero: Hero) {
        self.heroName = hero.name
        self.primaryAttribute = hero.primaryAttribute.localizedName
        self.attackType = hero.attackType.localizedName
        self.iconImage = hero.iconImage
    }
}
