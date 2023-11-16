//
//  Note.swift
//  Notes
//
//  Created by Aurora Morelli  on 16/11/23.
//

import Foundation
import SwiftData

@Model
class Note{
    
    var body: String
    var date: Date
    
    init(body: String = " ", date: Date = .now) {
        self.body = body
        self.date = date
    }
}
