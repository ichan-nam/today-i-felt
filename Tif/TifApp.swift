//
//  TifApp.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/04/27.
//

import SwiftUI

@main
struct TifApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
