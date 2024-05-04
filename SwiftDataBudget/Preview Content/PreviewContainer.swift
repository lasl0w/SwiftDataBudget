//
//  PreviewContainer.swift
//  SwiftDataBudget
//
//  Created by tom montgomery on 5/2/24.
//

import Foundation
import SwiftData

// GOAL of the pC is to allow our previews to persist
@MainActor
var previewContainer: ModelContainer {
    // The is the recommended technique per Apple
    let container = try! ModelContainer(for: Budget.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    // insert some data for the pC
    let budgets = [Budget(name: "groceries", limit: 125), Budget(name: "vacation", limit: 975)]
    
    for budget in budgets {
        // context is available only in the main thread, so you have to decorate it with the main actor macro
        container.mainContext.insert(budget)
    }
    
    return container
}
