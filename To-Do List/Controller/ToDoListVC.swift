//
//  ViewController.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 7/28/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import UIKit
import IBAnimatable

class ToDoListVC: UIViewController {
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var popUpView: UIVisualEffectView!
    @IBOutlet weak var editPopUp: EditPopUp!
    
    let toDo = RealmData.Tasks()
    let aniDuration = 0.7
    var taskEdit: toDoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        let projectCellNibFile = UINib(nibName: "CellDetails", bundle: nil)
        todoTableView.register(projectCellNibFile, forCellReuseIdentifier: "Cell")
        
        reloadData()
    }

    func reloadData() {
        todoTableView.reloadData()
    }
    
    @IBAction func addBut(_ sender: AnimatableView) {
        UIView.animate(withDuration: aniDuration) {
            self.popUpView.alpha = 1
        }
    }
    
//    @IBAction func doneBut(_ sender: AnimatableView) {
//        RealmData.addTask(text: newTaskTF.text!)
//        reloadData()
//        showNotificationBannerSwift(bannerTitle: "Task Added Sucessfully", bannerStyle: .success)
//        UIView.animate(withDuration: aniDuration) {
//            self.popUpView.alpha = 0
//        }
//        newTaskTF.text = ""
//    }
    
//    @IBAction func canselBut(_ sender: AnimatableView) {
//        UIView.animate(withDuration: aniDuration) {
////            self.popUpView.alpha = 0
////            self.newTaskTF.text = ""
//        }
//    }
}

extension ToDoListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "Cell") as! CellDetails
        let taskCellText = toDo[indexPath.row].toDoText
        cell.configureCell(textCell: taskCellText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmData.deleteTask(task: toDo[indexPath.row])
            reloadData()
            showNotificationBannerSwift(bannerTitle: "Task Deleted", bannerStyle: .danger)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: aniDuration) {
            self.popUpView.alpha = 1
        }
        taskEdit = toDo[indexPath.row]
        editPopUp.editTodoItem(item: taskEdit!)
    }
}

extension ToDoListVC: UITableViewDelegate {
    
}
