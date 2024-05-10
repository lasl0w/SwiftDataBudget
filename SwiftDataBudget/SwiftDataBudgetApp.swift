//
//  SwiftDataBudgetApp.swift
//  SwiftDataBudget
//
//  Created by tom montgomery on 4/9/24.
//

import SwiftUI

@main
struct SwiftDataBudgetApp: App {
    var body: some Scene {
        WindowGroup {
            // wrap in a navstack
            NavigationStack {
                ContentView()
            }.modelContainer(for: Budget.self)
            // Don't inject the preview container or in-memory! in our actual app we want to save it to the DB

        }
    }
}
