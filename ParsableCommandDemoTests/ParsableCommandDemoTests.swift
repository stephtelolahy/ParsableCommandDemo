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
            { "name": "drawDeck", "player": "p1", "count": 1 }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertNotNil(command)
    }
    
    func test_ParseCommand_WithDefaultValue() throws {
        let json = """
            { "name": "drawDeck", "player": "p1" }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertNotNil(command)
    }
    
    func test_ParseCommand_WithMissingValue() throws {
        let json = """
            { "name": "drawDeck" }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        
        
        XCTAssertThrowsError(try decoder.decode(DrawDeck.self, from: data))
    }

}
