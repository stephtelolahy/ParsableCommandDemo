//
//  CommandFamily.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 02/12/2020.
//


enum CommandFamily: String, DecodableClassFamily {
    typealias BaseType = Command
    
    case drawDeck
    case gainHealth
    
    static var discriminator: Discriminator { .type }
    
    func getType() -> Command.Type {
        switch self {
        case .drawDeck: return DrawDeck.self
        case .gainHealth: return GainHealth.self
        }
    }
}

