//
//  Uni5_CoreDataApp.swift
//  Uni5-CoreData
//
//  Created by user248205 on 7/2/24.
//

import SwiftUI

@main
struct Uni5_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
