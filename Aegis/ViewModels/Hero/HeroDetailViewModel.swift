//
//  HeroDetailViewModel.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain

struct HeroDetailViewModel {
    var heroName: String
    var profileImage: HeroImage
    var stats: [(key: String, value: String)]
    var roles: [Hero.Role]

    init(hero: Hero) {
        self.heroName = hero.name
        self.profileImage = hero.profileImage
        self.stats =
            [("Health", String(hero.stats.health)),
             ("Health regeneration", String(hero.stats.healthRegeneration)),
             ("Mana", String(hero.stats.mana)),
             ("Mana regeneration", String(hero.stats.manaRegeneration)),
             ("Armor", String(hero.stats.armor)),
             ("Minimum attack", String(hero.stats.minAttack)),
             ("Maximum attack", String(hero.stats.maxAttack)),
             ("Agility", String(hero.stats.agility)),
             ("Intelligence", String(hero.stats.intelligence)),
             ("Strength", String(hero.stats.strength)),
             ("Agility gain per level", String(hero.stats.agilityGain)),
             ("Intelligence gain per level", String(hero.stats.intelligenceGain)),
             ("Strength gain per level", String(hero.stats.strengthGain)),
             ("Attack range", String(hero.stats.attackRange)),
             ("Projectile speed", String(hero.stats.projectileSpeed)),
             ("Attack rate", String(hero.stats.attackRate)),
             ("Move speed", String(hero.stats.moveSpeed))]
        self.roles = hero.roles
    }
}

