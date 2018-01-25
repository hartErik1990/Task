//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Erik HARTLEY on 1/24/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    
    // MARK: - Properties
    var task: Task? {
        didSet {
            if isViewLoaded {
                updateViews()
            }
        }
    }
    var dueDateValue: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueTextField.inputView = dueDatePicker
        updateViews()
    }
    func updateViews() {
        guard let task = task, isViewLoaded else { return }
        
        title = task.name
        nameTextField.text = task.name
        dueTextField.text = (task.due as Date?)?.stringValue()
        notesTextView.text = task.notes
    }
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        let due = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        self.nameTextField.resignFirstResponder()
        self.dueTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
