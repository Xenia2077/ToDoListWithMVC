//
//  Delegates.swift
//  ToDoList
//
//  Created by Ксения Борисова on 13.12.2021.
//

import Foundation

protocol SaveUserTaskDelegate: class {
    func saveTask(named: String)
}

protocol RemoveTaskDelegate: class {
    func removeTask(task: TaskCell)
}
 
protocol TaskCompletedDelegate: class {
    func taskComplet(task: TaskCell)
}

protocol EditTaskDelegate: class {
    func editTask(task: TaskCell)
}


