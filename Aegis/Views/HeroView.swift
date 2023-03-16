//
//  HeroView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI

struct HeroView: View {
    var viewModel: HeroViewModel

    var body: some View {
        HStack {
            Image(heroImage: viewModel.iconImage)
                .padding()
                .accessibilityIdentifier("HeroView")
            VStack (alignment: .leading) {
                Text(viewModel.heroName)
                    .font(.title2)
                HStack {
                    Text("Primary Attribute:")
                        .font(.subheadline)
                    Spacer()
                    Text(viewModel.primaryAttribute)
                        .font(.caption)
                }
                .font(.subheadline)
                HStack {
                    Text("Attack type:")
                        .font(.subheadline)
                    Spacer()
                    Text(viewModel.attackType)
                        .font(.caption)
                }
                .font(.subheadline)
            }
        }
        .padding()
    }
}

