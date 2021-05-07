//
//  DeckToStore.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 07/05/2021.
//

class DeckToStore: Command {
    
    @Argument(name: "count", defaultValue: 1)
    var numberOfCards: Int
    
    @Argument(name: "hidden")
    var hidden: Bool
    
    override func run() -> String {
        "deck to store \(numberOfCards) hidden: \(hidden)"
    }
}
