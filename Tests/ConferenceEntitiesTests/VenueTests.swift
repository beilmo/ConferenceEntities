//
//  VenueTests.swift
//  ConferenceEntities
//
//  Created by Nicu Danciu on 18/09/2019.
//

import XCTest
@testable import ConferenceEntities

class VenueTests: XCTestCase {
    var sut: Venue!
    var id: Int!
    var venueName: String!
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        id = Int.random(in: 0...100)
        venueName = String.randomString(length: 10)
        sut = Venue(id: id, name: venueName)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVenueParams() {
        XCTAssertEqual(sut.id, id)
        XCTAssertEqual(sut.name, venueName)
    }
    
    func testEquatable() {
        let equalCandidate = Venue(id: id, name: venueName)
        XCTAssertEqual(sut, equalCandidate)
        
        let notEqualCandidate = Venue(id: id + 1, name: venueName + "ala")
        XCTAssertNotEqual(sut, notEqualCandidate)
        
    }
}
