//
//  MyNotesApp.swift
//  MyNotes
//
//  Created by Bartolomeo Davide Ventrone on 21/11/23.
//

import SwiftUI
import SwiftData

@main
struct MyNotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.accessibilityEnabled, true)
        }
        .modelContainer(for: Destination.self)
        
    }
}
