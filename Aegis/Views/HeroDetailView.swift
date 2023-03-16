//
//  HeroDetailView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI

struct HeroDetailView: View {
    var viewModel: HeroDetailViewModel

    var body: some View {
        VStack(alignment: .center) {
            Image(heroImage: viewModel.profileImage)
                .resizable()
                .scaledToFit()
                .accessibilityIdentifier("HeroProfileImage")
            List {
                Section("Base Stats") {
                    ForEach(viewModel.stats, id: \.key) { key, value in
                        HStack {
                            Text("\(key): ")
                            Spacer()
                            Text(value)
                        }
                    }
                }

                Section("Roles: ") {
                    HStack {
                        ForEach(viewModel.roles, id: \.self) { role in
                            Text(role.localizedName)
                                .font(.caption)
                                .padding(2)
                        }
                    }
                }
                .accessibilityIdentifier("HeroDetailsStats")
            }
        }
        .navigationTitle(viewModel.heroName)
        .navigationBarTitleDisplayMode(.automatic)

    }
}

