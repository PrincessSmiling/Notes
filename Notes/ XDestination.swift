//
//   Destination.swift
//  Notes
//
//  Created by Aurora Morelli  on 14/11/23.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var priority: Int
    
    init(name: String = "", details: String = "", priority: Int = 2 ) {
        self.name = name
        self.details = details
        self.priority = priority
    }
}
