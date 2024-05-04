//
//  Budget.swift
//  SwiftDataBudget
//
//  Created by tom montgomery on 4/9/24.
//

import Foundation
import SwiftData
// to use swiftData you must import swiftData!
// SwiftData writes to SQLite on the device

// in order for it to persist, just wrap it with the @Model macro, voilà
@Model
class Budget {
    // must be a CLASS in order to conform and use the @Model macro
    
    var name: String
    var limit: Double
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    // NOTE - IN SWIFTDATA, WE DON'T REALLY NEED A VIEWMODEL
    // Logic can go right here in the model.  Example:
//    var remaining: Double {
//        limit - spent
//    }
    
}

