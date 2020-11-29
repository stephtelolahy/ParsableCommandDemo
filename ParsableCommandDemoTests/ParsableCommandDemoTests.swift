//
//  ParsableCommandDemoTests.swift
//  ParsableCommandDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 29/11/2020.
//

import XCTest
@testable import ParsableCommandDemo

class ParsableCommandDemoTests: XCTestCase {
    
    func test_ParseCommand() throws {
        let json = """
        { "type": "drawDeck", "player": "p1", "count": 1 }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertEqual(String(describing: command), "ParsableCommandDemoTests.DrawDeck")
    }
    
    func test_ParseCommand_WithDefaultValue() throws {
        let json = """
        { "type": "drawDeck", "player": "p1" }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertEqual(String(describing: command), "ParsableCommandDemoTests.DrawDeck")
    }
    
    func test_ParseCommandFails_IfMissingValue() throws {
        let json = """
        { "type": "drawDeck" }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        
        
        XCTAssertThrowsError(try decoder.decode(DrawDeck.self, from: data))
    }
    
    func test_ParseArrayOfCommand() throws {
        let json = """
        [
            { "type": "drawDeck", "player": "p1" },
            { "type": "gainHealth", "player": "p1" }
        ]
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let commands: [ParsableCommand] = try decoder.decode(family: CommandFamily.self, from: data)
        
        XCTAssertEqual(String(describing: commands), "[ParsableCommandDemoTests.DrawDeck, ParsableCommandDemoTests.GainHealth]")
    }
    
}
