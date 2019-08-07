//
//  EditPopUp.swift
//  To-Do List
//
//  Created by Mac on 8/5/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import UIKit
import IBAnimatable

class EditPopUp: UIView {
    @IBOutlet weak var newTaskField: UITextField!
    
    var toDoList: toDoListproperties!
    var todoItem: toDoList?
    
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
        } else {
            RealmData.addTask(text: newTaskField.text!)
            self.toDoList.properties(isDone: true)
            showNotificationBannerSwift(bannerTitle: "Task Added Successfully", bannerStyle: .success)
            newTaskField.text = ""
        }
    }
    
    @IBAction func canselAction(_ sender: AnimatableView) {
        self.toDoList.properties(isDone: true)
        newTaskField.text = ""
    }
    
    func editTodoItem(item: toDoList) {
        
    }
}
