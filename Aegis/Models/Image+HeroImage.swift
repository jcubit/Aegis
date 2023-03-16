//
//  Image+HeroImage.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation

// A platform-independent image.

#if os(macOS)
import HeroDomain
import SwiftUI

extension Image {
    public init(heroImage: HeroImage) {
        self.init(nsImage: heroImage)
    }
}

#elseif os(iOS)
import HeroDomain
import SwiftUI

extension Image {
    public init(heroImage: HeroImage) {
        self.init(uiImage: heroImage)
    }
}
#endif


