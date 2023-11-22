//
//  EditNoteView.swift
//  MyNotes
//
//  Created by Bartolomeo Davide Ventrone on 21/11/23.
//

import SwiftUI
import SwiftData

struct EditNoteView: View {
    @Bindable var destination: Destination
    var body: some View {
        Form{
            TextField("Title", text: $destination.name)
            TextField("Note", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            Section("Priority"){
                Picker("Priority", selection: $destination.priority){
                    Text("Never").tag(1)
                    Text("Myabe").tag(2)
                    Text("Must").tag(3)
                    
                }
                .pickerStyle(.segmented)
            }
            
        }
        .navigationTitle("Edit Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            
                ToolbarItemGroup(placement:.keyboard){
                    HStack(spacing:30){
                    Button("Aa"){}.tint(.adaptation)
                    
                    Button("Add checklist",systemImage: "checklist"){}.tint(.adaptation)
                    
                    Button("Add grid",systemImage: "rectangle.split.3x3"){}.tint(.adaptation)
                    
                    Button("Add photo",systemImage: "camera"){}.tint(.adaptation)
                    
                    Button("Marker",systemImage: "pencil.tip.crop.circle"){}.tint(.adaptation)
                    
                    
                }
            }
            
        }
    }
}
    #Preview {
        do{
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for:Destination.self, configurations: config)
            let example = Destination(name: "",details: "")
            return EditNoteView(destination: example)
                .modelContainer(container)
            
        }catch{
            fatalError("Failed to create model container")
        }
    }



