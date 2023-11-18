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
      //  NavigationStack {
            TextEditor(text: $note.body)
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Spacer()
                        Button("Share", systemImage: "square.and.arrow.up", action: {})
                        Menu("Option", systemImage: "ellipsis.circle") {
                            Button("Lines & Grids", systemImage: "squareshape.split.3x3", action: {})
                        }
                    }
                }
            // .navigationTitle("Edit Notes")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Font", systemImage: "textformat.alt", action: {})
                            .foregroundColor(.gray)
                        Spacer()
                        Button("List", systemImage: "checklist", action: {})
                            .foregroundColor(.gray)
                        Spacer()
                        Button("Tabs", systemImage: "tablecells", action: {})
                            .foregroundColor(.gray)
                        Spacer()
                        Button("Camera", systemImage: "camera", action: {})
                            .foregroundColor(.gray)
                        Spacer()
                        Button("Drow", systemImage: "pencil.tip.crop.circle", action: {})
                            .foregroundColor(.gray)
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Font", systemImage: "textformat.alt", action: {})
                        Spacer()
                        Button("List", systemImage: "checklist", action: {})
                        Spacer()
                        Button("Tabs", systemImage: "tablecells", action: {})
                        Spacer()
                        Button("Camera", systemImage: "camera", action: {})
                        Spacer()
                        Button("Drow", systemImage: "pencil.tip.crop.circle", action: {})
                    }
                }
        }
       // }
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

