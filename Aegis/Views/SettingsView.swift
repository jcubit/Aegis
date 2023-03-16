//
//  SettingsView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation

import SwiftUI
import HeroDomain

struct SettingsView: View {
    @ObservedObject var filterMode: MainViewModel.FilterMode

    var body: some View {
        VStack {
            Text("Settings")
            Text("Swipe down to apply the chosen options")
                .font(.subheadline)
            Form {
                Section(header: Text("Filter Heroes")) {
                    Picker("Primary Attribute", selection: $filterMode.attribute) {
                        Text("Any").tag(Optional<Hero.Attribute>.none)
                        ForEach(Hero.Attribute.allCases) { attribute in
                            Text(attribute.localizedName).tag(Optional(attribute))
                        }
                    }
                    .accessibilityIdentifier("PrimaryAttributeButton")
                    .pickerStyle(.menu)

                    Section {
                        HStack {
                            Text("Attack Type")
                            Spacer()
                            Picker("Attack Type", selection: $filterMode.attack) {
                                Text("Any").tag(Optional<Hero.Attack>.none)
                                ForEach(Hero.Attack.allCases) { attack in
                                    Text(attack.localizedName).tag(Optional(attack))
                                }
                            }

                            .pickerStyle(.segmented)
                        }
                    }

                    Section {
                        Picker("Roles", selection: $filterMode.role) {
                            Text("Any").tag(Optional<Hero.Role>.none)
                            ForEach(Hero.Role.allCases) { role in
                                Text(role.localizedName).tag(Optional(role))
                            }
                        }
                        .pickerStyle(.menu)

                    }
                }
            }
        }
    }
}

