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
    @State private var sortOrder = SortDescriptor(\Note.date, order: .reverse)
    @State private var searchText = ""
    
    //@Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destination: [Destination]
    
   
    //@Query(sort: [SortDescriptor(\Note.date, order: .reverse), SortDescriptor(\Note.body)]) var note: [Note] //era commentato non so perchè
    
    var body: some View {
        NavigationStack(path: $path) {
            _NotesListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("All iCloud")
               // .navigationBarBackButtonHidden(true)
                .navigationDestination(for: Note.self, destination: ProspectView.init)
                //.navigationBarBackButtonHidden(true)
                .searchable(text: $searchText)
                .toolbar {
                    Menu("Folder Action", systemImage: "ellipsis.circle") {
                        // Picker("Sort", selection: $sortOrder) {
                        // Text("View as Gallery")
                        // .tag(SortDescriptor(\Destination.name))
                        
                        // Text("Select Notes")
                        //.tag(SortDescriptor(\Destination.priority ))
                        Button("View as Gallery", systemImage:"square.grid.2x2", action: {})
                        Button("Select Notes", systemImage:"checkmark.circle", action: {})
                        Button("View Attachments", systemImage:"paperclip", action: {})
                       
                    }
                    // .pickerStyle(.inline)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button( "New Note", systemImage: "square.and.pencil", action: addNote)
                    }
                }
              //.navigationBarBackButtonHidden(true)
        }
        
    }
    
    func addNote() {
        let note = Note()
        modelContext.insert(note)
        path = [note]
    }
    
}
    #Preview {
        ContentView()
    }

