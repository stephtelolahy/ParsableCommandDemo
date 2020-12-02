//
//  GainHealth.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

class GainHealth: Command {
    
    @Argument(name: "player")
    var player: String
    
    override func run() -> String {
        "\(player) gains health"
    }
}
