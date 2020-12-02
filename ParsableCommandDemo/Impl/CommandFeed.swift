//
//  CommandFeed.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 02/12/2020.
//

struct CommandFeed: Decodable {
    var commands: [Command]
    
    private enum CodingKeys: String, CodingKey {
        case commands
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        commands = try values.decode(family: CommandFamily.self, forKey: .commands)
    }
}
