//
//  Session.swift
//
//
//  Created by Alex Zaharia on 19/09/2019.
//

import Foundation

public class Session: Identifiable {
    public var id: Int
    public var title: String
    public var details: String
    public var startDate: Date
    public var duration: TimeInterval
    public var venue: Venue
    public var tags: [String]?

    init(id: Int, title: String, details: String, startDate: Date, duration: TimeInterval, venue: Venue, tags: [String]?) {
        self.id = id
        self.title = title
        self.details = details
        self.startDate = startDate
        self.duration = duration
        self.venue = venue
        self.tags = tags
    }
}

extension Session: Equatable {
    public static func == (lhs: Session, rhs: Session) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.details == rhs.details && lhs.startDate == rhs.startDate && lhs.duration == rhs.duration && lhs.venue == rhs.venue && lhs.tags == rhs.tags
    }
}

public extension Session {
    var getEndDate: Date {
        return startDate + duration
    }
}
