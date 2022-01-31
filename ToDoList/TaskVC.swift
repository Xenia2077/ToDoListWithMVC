//
//  TaskVC.swift
//  ToDoList
//
//  Created by Ксения Борисова on 13.12.2021.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var userTaskField: UITextField!
    
    weak var saveTaskDeleagate: SaveUserTaskDelegate?
    
     
    
    var listModel: ListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func saveTaskBtnPressed(_ sender: UIButton) {
        if let taskString = userTaskField.text {
            if !taskString.isEmpty {
                saveTaskDeleagate?.saveTask(named: taskString)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}
