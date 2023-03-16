//
//  RetryView.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import SwiftUI
import HeroDomain

struct RetryView: View {
    @Binding var fireUpdate: Bool
    var errorMessage: String

    init(fireUpdate: Binding<Bool>, error: Error) {
        self._fireUpdate = fireUpdate
        if let error = error as? FetchErrors {
            switch error {
                case .invalidServerResponse:
                    self.errorMessage = "There was an invalid server response"

                case .unsupportedImage:
                    self.errorMessage = "There is a request for unsupported image types"
            }
        } else {
            self.errorMessage = error.localizedDescription
        }
    }

    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Spacer()
            Text("Oh no 🤕😱, the following error has ocurred:")
                .font(.headline)
            Spacer()
            Text(errorMessage)
                .font(.subheadline)
            Spacer()

            Button("Retry Load") {
                fireUpdate.toggle()
            }.buttonStyle(.bordered)
            Spacer()
        }


    }
}

