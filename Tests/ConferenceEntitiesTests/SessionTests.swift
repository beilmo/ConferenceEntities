//
//  SessionTests.swift
//
//
//  Created by Alex Zaharia on 19/09/2019.
//

import XCTest
@testable import ConferenceEntities

class SessionsTests: XCTestCase {

    var sut: Session!
    var sessionId: Int!
    var sessionTitle: String!
    var sessionDetails: String!
    var sessionStartDate: Date!
    var sessionDuration: TimeInterval!
    var sessionVenue: Venue!
    var sessionTags: [String]!

    override func setUp() {
        sessionId = Int.random(in: 0...100)
        sessionTitle = String.randomString(length: 10)
        sessionDetails = String.randomString(length: 20)
        sessionStartDate = Date()
        sessionDuration = TimeInterval.random(in: 0...10000)
        sessionVenue = Venue(id: Int.random(in: 0...100), name: String.randomString(length: 10))
        sessionTags = [String.randomString(length: 10)]
        for _ in 0...Int.random(in: 0...100) {
            sessionTags.append(String.randomString(length: 10))
        }
        sut = Session(id: sessionId, title: sessionTitle, details: sessionDetails, startDate: sessionStartDate, duration: sessionDuration, venue: sessionVenue, tags: sessionTags)

    }

    override func tearDown() {
        sut = nil
        sessionId = nil
        sessionTitle = nil
        sessionDetails = nil
        sessionStartDate = nil
        sessionDuration = nil
        sessionVenue = nil
        sessionTags = nil
    }

    func testSessionParams() {
        XCTAssertEqual(sut.id, sessionId)
        XCTAssertEqual(sut.title, sessionTitle)
        XCTAssertEqual(sut.details, sessionDetails)
        XCTAssertEqual(sut.startDate, sessionStartDate)
        XCTAssertEqual(sut.duration, sessionDuration)
        XCTAssertEqual(sut.venue, sessionVenue)
        XCTAssertEqual(sut.tags, sessionTags)
    }

    func testSessionEquatable() {
        let equalCandidate = Session(id: sessionId, title: sessionTitle, details: sessionDetails, startDate: sessionStartDate, duration: sessionDuration, venue: sessionVenue, tags: sessionTags)
        XCTAssertEqual(sut, equalCandidate)

        let notEqualSessionVenue = Venue(id: sessionVenue.id + 1, name: sessionVenue.name + "A")
        let notEqualCandidate = Session(id: sessionId + 1, title: sessionTitle + "A", details: sessionDetails + "A", startDate: sessionStartDate + 1, duration: sessionDuration + 1, venue: notEqualSessionVenue, tags: sessionTags + ["a"])
        XCTAssertNotEqual(sut, notEqualCandidate)
    }

    func testSessionEndDateParam() {
        let sessionEndDate = sessionStartDate + sessionDuration
        print(sut.getEndDate)
        XCTAssertEqual(sut.getEndDate, sessionEndDate)
    }
}
