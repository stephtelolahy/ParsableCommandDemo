//
//  DrawDeck.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

struct DrawDeck: ParsableCommand {
    
    var player: String = ""
    
    func run() {
        print("player \(player) draw card from deck")
    }
}
