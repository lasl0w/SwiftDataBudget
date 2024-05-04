//
//  ContentView.swift
//  SwiftDataBudget
//
//  Created by tom montgomery on 4/9/24.
//

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    // Access the modelContext through the environment
    @Environment(\.modelContext) private var context
    // will help us persist, delete, fetch budgets, etc
    // 'context' issss the ability to save to the DB
    
    // use @Query to fetch the budgets
    @Query private var budgets: [Budget] = []
    
    // Add state props for form data
    @State private var name: String = ""
    // limit starts out null
    @State private var limit: Double?
    
    
    var body: some View {
        Form {
            
            Section("New Budget") {
                
                TextField("Enter name", text: $name)
                //TODO: why is currency hard to work with (i.e. - enter data and it adds .00 at the end AND sets the cursor position to the end. figure out how to stop it from doing that!
                //TextField("Enter limit", value: $limit, format: .currency(code: "USD"))
                // change to number b/c it's easier to work with in previews
                TextField("Enter limit", value: $limit, format: .number)
                Button("Save") {
                    // validate the name and limit
                    
                    // save the budget to the DB (in memory)
                    
                    // must unwrap it.  If it's not a double, bail
                    guard let limit = limit else { return }
                    
                    let budget = Budget(name: name, limit: limit)
                    context.insert(budget)
                    // don't need to explicitly call context.save() b/c insert will persist it (it just does it in it's own time)
                }
            }
            
            Section("Budget List") {
                List(budgets) { budget in
                    Text(budget.name)
                }
            }
        }
        .navigationTitle("Budget")
    }
}

#Preview {
    // Add a NavStack so we can get the title
    NavigationStack {
        ContentView()
    }.modelContainer(previewContainer)
        
    //}.modelContainer(for: Budget.self, inMemory: true)
    // just keep it in memory b/c we don't care about persisting to the DB (initial approach)
}
