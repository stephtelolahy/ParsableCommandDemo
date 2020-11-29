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
        let text = """
            { "name": "drawDeck", "player": "p1" }
        """
        let data = try XCTUnwrap(text.data(using: .utf8))
        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let command = try DrawDeck.parse(json)
        
        XCTAssertNotNil(command)
    }

}
