//
//  StateMachine.swift
//  Aegis
//
//  Created by Javier Cuesta on 16.03.23.
//

import Foundation

struct StateMachine {
    private(set) var state: State

    enum State {
        case empty
        case loading
        case loaded
        case error(Error)
    }

    mutating func load() throws {
        switch state {
            case .empty, .loaded, .error:
                self.state = .loading
            case .loading:
                throw D2HeroesError.invalidTransition(state: state, event: "load")
        }
    }

    mutating func receiveHeroes() throws {
        switch state {
            case .loading:
                self.state = .loaded
            case .empty, .loaded, .error:
                throw D2HeroesError.invalidTransition(state: state, event: "receiveHeroes")
        }
    }

    mutating func handle(error: Error) {
        switch state {
            case .loading:
                self.state = .error(error)
            case .error, .empty, .loaded:
                break
        }
    }

    init() {
        self.state = .empty
    }
}

enum D2HeroesError: Error {
    case invalidTransition(state: StateMachine.State, event: String)
}

