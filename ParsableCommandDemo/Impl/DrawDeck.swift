//
//  DrawDeck.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

struct DrawDeck: ParsableCommand {
    
    @Argument(name: "player")
    var player: String
    
    @Argument(name: "count", defaultValue: 1)
    var numberOfCards: Int
    
    func run() {
        print("player \(player) draw \(numberOfCards) cards from deck")
    }
}

extension DrawDeck: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArgumentCodingKey.self)
        for child in Mirror(reflecting: self).children {
            guard let argument = child.value as? DecodableArgument else {
                continue
            }
            try argument.decodeValue(from: container)
        }
    }
}
