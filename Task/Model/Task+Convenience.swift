//
//  Task+Convenience.swift
//  Task
//
//  Created by Erik HARTLEY on 1/24/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String?, due: Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = nil
        self.due = nil
        self.isComplete = false
    }
}
