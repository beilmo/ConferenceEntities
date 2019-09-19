//
//  Speaker.swift
//
//
//  Created by Alex Zaharia on 19/09/2019.
//

import Foundation

class Speaker: Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var employer: String
    var jobTitle: String?
    var biography: String?
    var personalWebsite: String?

    init(id: Int, firstName: String, lastName: String, employer: String, jobTitle: String?, biography: String, personalWebsite: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.employer = employer
        self.jobTitle = jobTitle
        self.biography = biography
        self.personalWebsite = personalWebsite
    }
}

extension Speaker: Equatable {
    static func == (lhs: Speaker, rhs: Speaker) -> Bool {
        return lhs.id == rhs.id && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.employer == rhs.employer && lhs.jobTitle == rhs.jobTitle && lhs.biography == rhs.biography && lhs.personalWebsite == rhs.personalWebsite
    }
}

extension Speaker {
    @available(OSX 10.11, *)
    public var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        var nameComponents = PersonNameComponents()
        nameComponents.givenName = firstName
        nameComponents.familyName = lastName
        
        return formatter.string(from: nameComponents)
    }
    public var position: String {
        guard let job = jobTitle else {
            return employer
        }
        return "\(job) at \(employer)"
    }
}
