//
//  Command.swift
//  ParsableCommandDemo
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

class Command: Decodable {
    
    func run() ->String {
        fatalError("Should be implemented in child class")
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArgumentCodingKey.self)
        for child in Mirror(reflecting: self).children {
            guard let argument = child.value as? DecodableArgument else {
                continue
            }
            try argument.decodeValue(from: container)
        }
    }
}
