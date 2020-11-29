//
//  GainHealth.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

class GainHealth: ParsableCommand {
    
    @Argument(name: "player")
    var player: String
    
    override func run() {
        print("\(player) gain health")
    }
}
