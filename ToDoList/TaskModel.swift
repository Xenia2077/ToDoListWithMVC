//
//  TaskModel.swift
//  ToDoList
//
//  Created by Ксения Борисова on 13.12.2021.
//

import Foundation
import UIKit


// в этом файле прописана структура задачи и модель списка с его методами

struct TaskModel {
    var taskName: String
    var currentIndex: IndexPath?
    var isSelected: Bool = false 
}


// данные хранятся в массиве, который и обрабатывают методы
class ListModel {
    var tasksArray: [TaskModel] = []
    var sortedAscending = Bool()

    func addTask(taskName: String) {
        tasksArray.append(
            TaskModel(taskName: taskName)
        )
    }

    func editTask(at index: Int, newName: String) {
        tasksArray[index].taskName = newName
        sortByName()
    }

    func removeTask(at index: Int) {
        tasksArray.remove(at: index)
    }

    func sortByName() {
        tasksArray.sort {
            sortedAscending ? $0.taskName < $1.taskName : $0.taskName > $1.taskName
        }
    }

}
