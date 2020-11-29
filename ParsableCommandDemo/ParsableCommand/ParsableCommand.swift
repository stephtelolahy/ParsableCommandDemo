//
//  ParsableCommand.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

protocol ParsableCommand {
    func run()
}

extension ParsableCommand {
    
    // Parses an instance of this type, from json
    static func parse(_ json: [String: Any]) throws -> ParsableCommand {
        let parser = CommandParser(self)
        return try parser.parse(json)
    }
}

struct CommandParser {
    
    let commandType: ParsableCommand.Type
    
    init(_ commandType: ParsableCommand.Type) {
        self.commandType = commandType
    }
    
    func parse(_ json: [String: Any]) throws -> ParsableCommand {
        DrawDeck()
    }
}

enum ParsingError: Error {
    case missing(String)
    case invalid(String, Any)
}
