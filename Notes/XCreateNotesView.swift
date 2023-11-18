//
//  CreateNotesView.swift
//  Notes
//
//  Created by Aurora Morelli  on 16/11/23.
//

import SwiftUI
import SwiftData

struct CreateNotesView: View {
    
    @Bindable var note: Note
    // @State private var name = "Taylor"
    
    var body: some View {
        VStack{
            TextEditor(text: $note.body)
                        }
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard) {
                                Button("Font", systemImage: "textformat.alt", action: {})
                                Button("List", systemImage: "checklist", action: {})
                                Button("Tabs", systemImage: "tablecells", action: {})
                                Button("Camera", systemImage: "camera", action: {})
                                Button("Drow", systemImage: "pencil.tip.crop.circle", action: {})
                              // Spacer()
                               // Button("Add notes", systemImage: "square.and.pencil", action: {})
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
    
