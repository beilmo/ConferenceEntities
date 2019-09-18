//
//  Venue.swift
//  
//
//  Created by Nicu Danciu on 18/09/2019.
//

import Foundation

public class Venue: Identifiable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension Venue: Equatable {
    public static func == (lhs: Venue, rhs: Venue) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
