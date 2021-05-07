//
//  DrawHand.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 07/05/2021.
//

class DrawHand: Command {
    
    @Argument(name: "player")
    var player: String
    
    @Argument(name: "other")
    var other: PlayerArgument
    
    override func run() -> String {
        "\(player) draws card from \(other)'s hand"
    }
}

enum PlayerArgument: String, Decodable {
    case target
    case all
    case offender
    case next
}
