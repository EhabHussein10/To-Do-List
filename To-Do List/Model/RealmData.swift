//
//  RealmData.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 7/30/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import Foundation
import RealmSwift

class RealmData: Object {
    
class func addTask(text: String) {

        let realm = try! Realm()
        try! realm.write {
            let todo = toDoList()
            todo.id = incrementID()
            todo.toDoText = text
            todo.isDone = false
            realm.add(todo, update: true)
        }
        
        func incrementID() -> Int {
            let realm = try! Realm()
            return Int((realm.objects(toDoList.self).max(ofProperty: "id") as Int? ?? 0) + 1)
        }
    }
    
class func editTask(task: toDoList, updatedText: String, updatedStatus: Bool) {
        
        let realm = try! Realm()
        try! realm.write {
            task.toDoText = updatedText
            task.isDone = updatedStatus
        }
    }
    
class func Tasks() -> Results<toDoList> {
        
        let realm = try! Realm()
        let tasks = realm.objects(toDoList.self)
        return tasks
    }
    
class func deleteTask(task: toDoList) {
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(task)
        }
    }
}
