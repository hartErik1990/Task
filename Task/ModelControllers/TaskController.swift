//
//  TaskModelController.swift
//  Task
//
//  Created by Erik HARTLEY on 1/24/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
   
    static let shared = TaskController()
    
    var task: [Task] = []
   
    // MARK: - CRUD
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func delete(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistentStore()
        }
    }
    
    // MARK: - SaveToPersistentStore
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let myCoreDataError {
            print(" there was a problem saving: \(myCoreDataError.localizedDescription)")
        }
    }
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let array = (try? CoreDataStack.context.fetch(request)) ?? []
        return array
    }
}
