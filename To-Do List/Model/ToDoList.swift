//
//  ToDoLest.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 7/31/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import Foundation
import RealmSwift

class toDoList: Object {
    @objc dynamic var id = 0
    @objc dynamic var toDoText = ""
    @objc dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
