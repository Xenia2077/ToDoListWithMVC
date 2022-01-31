//
//  TaskListTVC.swift
//  ToDoList
//
//  Created by Ксения Борисова on 13.12.2021.
//

import UIKit

class TaskListTVC: UITableViewController {
    
    var btnPlusIsPressed = false
    var taskSelected = false
    var indexOfSelectedTask = Int()
    
    var listModel = ListModel()
    var vc = TaskVC()

    @IBOutlet weak var sortingIndicator: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.tasksArray.count
    }
    
    // чтобы отредактировать задачу, переходим в тот же VC, что занимается и сохранением новых
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnPlusIsPressed = false
        taskSelected = true
        indexOfSelectedTask = indexPath.row
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.saveTaskDeleagate = self
        present(vc, animated: true, completion: nil)
    }

    
    // во время активации кнопки сортировки обращаемся к модели для получения и изменения данных – сортируем массив
    @IBAction func sortByName(_ sender: UIButton) {
        listModel.sortedAscending = !listModel.sortedAscending
        listModel.sortByName()
        
        tableView.reloadData()
    }
    
    // для добавления новой задачи переходим на VC, который этим занимается
    @IBAction func showTaskVC(_ sender: Any) {
        taskSelected = false
        btnPlusIsPressed = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.saveTaskDeleagate = self
        present(vc, animated: true, completion: nil)
      }
     
    
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        listModel.tasksArray[indexPath.row].currentIndex = indexPath
        let currentTask = listModel.tasksArray[indexPath.row]
        cell.cellData(task: currentTask)
        cell.taskCellTextLabel.text = currentTask.taskName
        
        cell.removeTaskDelegate = self
        
        return cell
      }
    }
     
// прописываем необходимые расширения для работы делегатов
extension TaskListTVC: SaveUserTaskDelegate {
      func saveTask(named: String) {
        if btnPlusIsPressed {
                listModel.addTask(taskName: named)
        } else if taskSelected {
            listModel.editTask(at: indexOfSelectedTask, newName: named)
        }
        
        listModel.sortByName()
        tableView.reloadData()
      }
}

extension TaskListTVC: RemoveTaskDelegate {
      func removeTask(task: TaskCell) {
        let indexPath = tableView.indexPath(for: task)
        listModel.removeTask(at: indexPath!.row)
        tableView.reloadData()
      }
}


     
