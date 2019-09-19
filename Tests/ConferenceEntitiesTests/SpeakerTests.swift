//
//  SpeakerTests.swift
//
//
//  Created by Alex Zaharia on 19/09/2019.
//

import XCTest
@testable import ConferenceEntities

class SpeakerTests: XCTestCase {

    var sut: Speaker!
    var speakerId: Int!
    var speakerFirstName: String!
    var speakerLastName: String!
    var speakerEmployer: String!
    var speakerJobTitle: String!
    var speakerBiography: String!
    var speakerPersonalWebsite: String!

    override func setUp() {
        speakerId = Int.random(in: 0...100)
        speakerFirstName = String.randomString(length: 10)
        speakerLastName = String.randomString(length: 10)
        speakerEmployer = String.randomString(length: 10)
        speakerJobTitle = String.randomString(length: 10)
        speakerBiography = String.randomString(length: 10)
        speakerPersonalWebsite = String.randomString(length: 10)
        sut = Speaker(id: speakerId, firstName: speakerFirstName, lastName: speakerLastName, employer: speakerEmployer, jobTitle: speakerJobTitle, biography: speakerBiography, personalWebsite: speakerPersonalWebsite)
    }

    override func tearDown() {
        sut = nil
        speakerId = nil
        speakerFirstName = nil
        speakerLastName = nil
        speakerEmployer = nil
        speakerJobTitle = nil
        speakerBiography = nil
        speakerPersonalWebsite = nil
    }

    func testSpeakerParams() {
        XCTAssertEqual(sut.id, speakerId)
        XCTAssertEqual(sut.firstName, speakerFirstName)
        XCTAssertEqual(sut.lastName, speakerLastName)
        XCTAssertEqual(sut.employer, speakerEmployer)
        XCTAssertEqual(sut.jobTitle, speakerJobTitle)
        XCTAssertEqual(sut.biography, speakerBiography)
        XCTAssertEqual(sut.personalWebsite, speakerPersonalWebsite)
    }

    func testSpeakerEquatable() {
        let equalCandidate = Speaker(id: speakerId, firstName: speakerFirstName, lastName: speakerLastName, employer: speakerEmployer, jobTitle: speakerJobTitle, biography: speakerBiography, personalWebsite: speakerPersonalWebsite)
        XCTAssertEqual(sut, equalCandidate)
        
        let notEqualCandidate = Speaker(id: speakerId + 1, firstName: speakerFirstName + "A", lastName: speakerLastName, employer: speakerEmployer + "A", jobTitle: speakerJobTitle + "A", biography: speakerBiography + "A", personalWebsite: speakerPersonalWebsite + "A")
        XCTAssertNotEqual(sut, notEqualCandidate)
    }

    @available(OSX 10.11, *)
    func testSpeakerFullNameFormatter() {
        let formatter = PersonNameComponentsFormatter()
        var nameComponents = PersonNameComponents()
        nameComponents.givenName = speakerFirstName
        nameComponents.familyName = speakerLastName
        
        let speakerFullName = formatter.string(from: nameComponents)
        XCTAssertEqual(sut.fullName, speakerFullName)
    }

    func testSpeakerPositionWhenJobTitleIsAvailable() {
        let speakerPosition = "\(speakerJobTitle!) at \(speakerEmployer!)"
        XCTAssertEqual(sut.position, speakerPosition)
    }

    func testSpeakerPositionWhenJobTitleIsUnavailable() {
        sut.jobTitle = nil
        XCTAssertEqual(sut.position, speakerEmployer)
    }
}
