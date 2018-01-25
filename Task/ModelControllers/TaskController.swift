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
    
    var tasks = [Task]()
   
    init() {
        tasks = fetchTasks()
    }
    // MARK: - CRUD
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func delete(task: Task) {
        task.managedObjectContext?.delete(task)
            saveToPersistentStore()
            tasks = fetchTasks()
        
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    // MARK: - SaveToPersistentStore
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
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
