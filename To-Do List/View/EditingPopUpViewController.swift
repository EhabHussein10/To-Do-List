//
//  EditingPopUpViewController.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 8/5/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import UIKit
import IBAnimatable

class EditingPopUpViewController: UIView {
    @IBOutlet weak var newTaskField: UITextField!
    
    var toDoList: toDoListproperties!
    var todoItem: toDoList?
    var delegate: EditPopupState!
    
    init() {
        super.init(frame: toDoList as! CGRect)
        toDoList = frame as? toDoListproperties
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func doneAction(_ sender: AnimatableView) {
        if todoItem != nil {
            RealmData.editTask(task: todoItem!, updatedText: newTaskField.text!, updatedStatus: true)
            showNotificationBannerSwift(bannerTitle: "Task Edited Successfully", bannerStyle: .success)
            delegate.hideEdit()
        } else {
            RealmData.addTask(text: newTaskField.text!)
            self.toDoList.getProperties(isDone: true)
            showNotificationBannerSwift(bannerTitle: "Task Added Successfully", bannerStyle: .success)
            newTaskField.text = ""
        }
    }
    
    @IBAction func cancelAction(_ sender: AnimatableView) {
        self.toDoList.getProperties(isDone: true)
        newTaskField.text = ""
    }
    
    func editTodoItem(item: toDoList) {
        print(item.toDoText)
        newTaskField.text = item.toDoText
        todoItem = item
    }
}
