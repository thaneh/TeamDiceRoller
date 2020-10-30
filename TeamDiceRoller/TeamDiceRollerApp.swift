//
//  TeamDiceRollerApp.swift
//  TeamDiceRoller
//
//  Created by Thane Heninger on 10/30/20.
//

import SwiftUI

@main
struct TeamDiceRollerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) 
        }
    }
}
