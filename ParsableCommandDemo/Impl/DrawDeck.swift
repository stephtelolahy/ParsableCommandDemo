//
//  DrawDeck.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

class DrawDeck: Command {
    
    @Argument(name: "player")
    var player: String
    
    @Argument(name: "count", defaultValue: 1)
    var numberOfCards: Int
    
    override func run() -> String {
        "\(player) draws \(numberOfCards) cards from deck"
    }
}
