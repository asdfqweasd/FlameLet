//
//  TaskManager.swift
//  DouBanDemo
//
//  Created by Keyu LI on 28/9/2022.
//

import Foundation
import RealmSwift

//Reference
//Build a SwiftUI to-do app from scratch with Realm Crash Course. (n.d.). Www.youtube.com. Retrieved October 18, 2022, from https://www.youtube.com/watch?v=b6q9vKaXtoU

class TaskManager:ObservableObject{
    private(set) var localRealm:Realm?
    
    @Published var tasks:[Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion:1)
            
            Realm.Configuration.defaultConfiguration =  config
            
            localRealm = try Realm()
        } catch{
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitile:String, date:Date){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title": taskTitile, "taskDate":date, "complete":false])
                    localRealm.add(newTask)
                    getTasks()
                    print("add new task to realm: \(newTask)")
                }
            } catch{
                print("errow adding new task to realm: \(error)")
            }
        }
    }
    
    func getTasks(){
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self)
            tasks = []
            allTasks.forEach{task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id:ObjectId, complete:Bool){
        if let localRealm = localRealm {
            do{
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else{return}
                
                try localRealm.write {
                    taskToUpdate[0].complete = complete
                    getTasks()
                    print("update successful with id: \(id)")
                }
            } catch {
                print("errow updating task to realm: \(error)")
            }
        }
    }
    
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm {
            do{
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else{return}
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("delete successful with id: \(id)")
                }
            } catch{
                print("errow deleting task to realm: \(error)")
            }
        }
    }
    
    func isSameDay(date1: Date, date2:Date)-> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func countCompletedTask()->Int{
        var completedTasks = 0
        for task in tasks{
            if task.complete{
                completedTasks += 1
            }
        }
        return completedTasks
    }
    
    func countIncompletedTask(today:Date)->Int{
        let formate = DateFormatter()
        formate.dateFormat =  "yyyyMMdd"
        var IncompletedTasks = 0
        for task in tasks{
            if !task.complete && formate.string(from: today)  == formate.string(from: task.taskDate){
                IncompletedTasks += 1
            }
        }
        return IncompletedTasks
    }
}
