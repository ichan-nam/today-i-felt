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

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

enum Field: Hashable {
    case who
    case what
    case place
}
