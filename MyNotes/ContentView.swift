//
//  ContentView.swift
//  MyNotes
//
//  Created by Bartolomeo Davide Ventrone on 21/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)])var destinations: [Destination]
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    var body: some View {
        NavigationStack(path: $path){
            DestinationListingView(sort: sortOrder, searchString: searchText)
            .navigationTitle("Notes")
            .navigationDestination(for: Destination.self, destination: EditNoteView.init)
            .searchable(text:$searchText)
            .toolbar{
                
                Menu("Sort",systemImage: "arrow.up.arrow.down"){
                    Picker("Sort",selection:$sortOrder){
                        Text("Name")
                            .tag(SortDescriptor(\Destination.name))
                        Text("Priority")
                            .tag(SortDescriptor(\Destination.priority, order: .reverse))
                        Text("Date")
                            .tag(SortDescriptor(\Destination.date))
                    }
                    
                }
                .pickerStyle(.inline)
                
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Spacer()
                    Button("Add Note", systemImage: "square.and.pencil", action: addNote)
                }
            }
        }
    }
    func addNote(){
     let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
}

#Preview {
    ContentView()
}
