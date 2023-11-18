//
//   NotesListingView.swift
//  Notes
//
//  Created by Aurora Morelli  on 15/11/23.
//

import SwiftData
import SwiftUI

struct _NotesListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Note.date)]) var note: [Note]
    
    var body: some View {
        List {
            ForEach(note) {  note in
                NavigationLink(value: note) {
                    VStack(alignment: .leading) {
                        Text(note.body)
                            .font(.headline)
                    }
                }
            }
           .onDelete(perform: deleteNote)
        }
    } 
    
    init(sort: SortDescriptor<Note>, searchString: String) {
      
        _note = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.body.localizedStandardContains(searchString)
                
            }
        },  sort: [sort])
    }
    
     func deleteNote (_ indexSet: IndexSet) {
        for index in indexSet {
            let note = note[index]
            modelContext.delete(note)
        }
    }
}

#Preview {
    _NotesListingView(sort: SortDescriptor(\Note.date), searchString: "")
}
