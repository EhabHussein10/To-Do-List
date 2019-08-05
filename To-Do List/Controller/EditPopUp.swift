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
    
    var todoItem: toDoList?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func doneAction(_ sender: AnimatableView) {
        if todoItem != nil {
            RealmData.editTask(task: todoItem!, updatedText: newTaskField.text!, updatedStatus: true)
            showNotificationBannerSwift(bannerTitle: "Task Edited Successfully", bannerStyle: .success)
        } else {
            RealmData.addTask(text: newTaskField.text!)
            showNotificationBannerSwift(bannerTitle: "Task Added Successfully", bannerStyle: .success)
        }
    }
    
    @IBAction func canselAction(_ sender: AnimatableView) {
        
    }
    
    func editTodoItem(item: toDoList) {
        
    }
    
}
