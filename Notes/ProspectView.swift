//
//  ProspectView.swift
//  Notes
//
//  Created by Aurora Morelli  on 14/11/23.
//

import SwiftUI
import SwiftData

struct ProspectView: View {
    
    @Bindable var note: Note
    var body: some View {
        TextEditor(text: $note.body)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing) {
                Spacer()
                Button("Add notes", systemImage: "square.and.pencil", action: {})
            }
        }
            .navigationTitle("Edit Notes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let example = Note(body: " ", date: .now)
        return CreateNotesView(note: example)
            .modelContainer(container)
        
    } catch {
        fatalError("Failed to create a model container.")
        
    }
}

