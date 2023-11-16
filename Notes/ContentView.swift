//
//  ContentView.swift
//  Notes
//
//  Created by Aurora Morelli  on 13/11/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Note]()
    @State private var sortOrder = SortDescriptor(\Note.date)
    @State private var searchText = ""
    
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destination: [Destination]

    @Query(sort: [SortDescriptor(\Note.date)]) var note: [Note]
    
    var body: some View {
        NavigationStack(path: $path) {
            _NotesListingView(sort: sortOrder, searchString: searchText )
            .navigationTitle("All iCloud")
            .navigationDestination(for: Note.self, destination: ProspectView.init)
            .searchable(text: $searchText )
            .toolbar {
                Menu("View", systemImage: "ellipsis.circle") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("View as Gallery")
                            .tag(SortDescriptor(\Destination.name))
                        
                        Text("Select Notes")
                            .tag(SortDescriptor(\Destination.priority ))
                    }
                    .pickerStyle(.inline) 
                }
            }    
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button( "Add Notes", systemImage: "square.and.pencil", action: addNote)
                }
            }
        }
    }
    
    func addNote() {
        let note = Note()
        modelContext.insert(note)
        path = [note]
    }
    
    func deleteNote(_ indexSet: IndexSet) {
        for index in indexSet {
            let note = note[index]
            modelContext.delete(note)
        }
    }
}
    
#Preview {
    ContentView()
}
