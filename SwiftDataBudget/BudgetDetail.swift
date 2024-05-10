//
//  BudgetDetail.swift
//  SwiftDataBudget
//
//  Created by tom montgomery on 5/7/24.
//

import SwiftUI
import SwiftData

struct BudgetDetail: View {
    
    // introduced in ios17
    @Bindable var budget: Budget
    
    var body: some View {
        Form {
            // the power of BINDING - directly to the source
            // changes here are propogated to the DB
            TextField("Enter Name", text: $budget.name)
            TextField("Enter Limit", value: $budget.limit, format: .number)
        }
    }
}

// Use the "Container pattern" to make the preview work
struct BudgetDetailContainer: View {
    
    // check out https://useyourloaf.com/blog/debugging-core-data/
    // Edit Scheme > Add arguments.  enable debug of SQL statements or at least see what's going on under the hood
    @Query private var budgets: [Budget]
    
    var body: some View {
        BudgetDetail(budget: budgets[0])
    }
}
// Can't do an @Query in the preview (not allowed) so we use this container pattern
#Preview { @MainActor in
    NavigationStack {
        BudgetDetailContainer()
            .modelContainer(previewContainer)
    }

}
