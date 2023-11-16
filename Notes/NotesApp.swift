//
//  NotesApp.swift
//  Notes
//
//  Created by Aurora Morelli  on 13/11/23.
//

import SwiftData
import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
