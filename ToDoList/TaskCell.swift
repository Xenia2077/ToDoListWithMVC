//
//  TaskCell.swift
//  ToDoList
//
//  Created by Ксения Борисова on 13.12.2021.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskCellTextLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var executeBtn: UIButton!
    
    weak var removeTaskDelegate: RemoveTaskDelegate?
    weak var editTaskDelegate: EditTaskDelegate?
    
    var task: TaskModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // используем делегат для работы кнопки удаления задачи
    @IBAction func removeTaskBtnPressed(_ sender: UIButton) {
        removeTaskDelegate?.removeTask(task: self)
    }
    
    // эта функция меняет статус задачи на завершенную (к сожалению, так и не смогла разобраться, как прикрутить изменение image для кнопки, чтобы менялась обратно на изначальную при повторном нажатии)
    @IBAction func executeTaskBtnPresed(_ sender: UIButton) {
        guard var task = task else { return }
        task.isSelected = !task.isSelected
        executeBtn.isSelected = task.isSelected
    }
    
    
    // здесь хравнятся данные ячейки, необходимые для ее отображения
    func cellData(task: TaskModel) {
        taskCellTextLabel.text = task.taskName
        
        executeBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        executeBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        executeBtn.isSelected = task.isSelected
        
        self.task = task
      }
    
}


