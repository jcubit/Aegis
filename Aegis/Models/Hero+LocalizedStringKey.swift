//
//  Hero+LocalizedStringKey.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain

extension Hero.Attribute {
    var localizedName: LocalizedStringKey {
        switch self {
            case .agility: return "Agility"
            case .intelligence: return "Intelligence"
            case .strength: return "Strength"
        }
    }
}

extension Hero.Role {
    var localizedName: LocalizedStringKey {
        switch self {
            case .carry: return "Carry"
            case .escape: return "Escape"
            case .nuker: return "Nuker"
            case .initiator: return "Initiator"
            case .durable: return "Durable"
            case .disabler: return "Disabler"
            case .jungler: return "Jungler"
            case .support: return "Support"
            case .pusher: return "Pusher"
        }
    }
}

extension Hero.Attack {
    var localizedName: LocalizedStringKey {
        switch self {
            case .melee: return "Melee"
            case .ranged: return "Ranged"
        }
    }
}
