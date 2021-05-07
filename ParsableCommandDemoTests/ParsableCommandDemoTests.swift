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
        {
          "type": "drawDeck",
          "player": "p1",
          "count": 2
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertEqual(command.run(), "p1 draws 2 cards from deck")
    }
    
    func test_ParseCommand_WithDefaultValue() throws {
        let json = """
        {
          "type": "drawDeck",
          "player": "p1"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let command = try decoder.decode(DrawDeck.self, from: data)
        
        XCTAssertEqual(command.run(), "p1 draws 1 cards from deck")
    }
    
    func test_ParseCommandFails_IfMissingValue() throws {
        let json = """
        {
          "type": "drawDeck"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(DrawDeck.self, from: data))
    }
    
    func test_ParseCommandFails_IfValueTypeMistmatch() throws {
        let json = """
        {
          "type": "drawDeck",
          "player": 0
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(DrawDeck.self, from: data))
    }
    
    func test_ParseArrayOfCommand() throws {
        let json = """
        [
          {
            "type": "drawDeck",
            "player": "p1"
          },
          {
            "type": "gainHealth",
            "player": "p1"
          }
        ]
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let commands = try decoder.decode(family: CommandFamily.self, from: data)
        
        XCTAssertEqual(commands.count, 2)
        XCTAssertEqual(commands[0].run(), "p1 draws 1 cards from deck")
        XCTAssertEqual(commands[1].run(), "p1 gains health")
    }
    
    func test_ParseCommandFeed() throws {
        let json = """
        {
          "commands": [
            {
              "type": "drawDeck",
              "player": "p1"
            },
            {
              "type": "gainHealth",
              "player": "p1"
            },
            {
            "type": "deckToStore",
            "hidden": true
            },
            {
            "type": "drawHand",
            "player": "p1",
            "other": "all"
            }
          ]
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let feed = try decoder.decode(CommandFeed.self, from: data)
        
        let commands = feed.commands
        XCTAssertEqual(commands.count, 4)
        XCTAssertEqual(commands[0].run(), "p1 draws 1 cards from deck")
        XCTAssertEqual(commands[1].run(), "p1 gains health")
        XCTAssertEqual(commands[2].run(), "deck to store 1 hidden: true")
        XCTAssertEqual(commands[3].run(), "p1 draws card from all's hand")
    }
    
    func test_ParseCommandFeedFails_IfUnknownType() throws {
        let json = """
                {
                  "commands": [
                    {
                      "type": "unknown",
                      "player": "p1"
                    }
                  ]
                }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(CommandFeed.self, from: data))
    }
    
}
