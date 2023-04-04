//
//  ProjectViewModel.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import Foundation
import RealmSwift

//Reference
//Build a SwiftUI to-do app from scratch with Realm Crash Course. (n.d.). Www.youtube.com. Retrieved October 18, 2022, from https://www.youtube.com/watch?v=b6q9vKaXtoU

class ProjectManager:ObservableObject{
    private(set) var localRealm:Realm?
    
    @Published var projects:[Project] = []
    
    init(){
        openRealm()
        getProjects()
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
    
    func addProject(ProjectTitile:String, startDate:Date, endDate:Date, dueDate:Date){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Project(value: ["title": ProjectTitile, "startDate":startDate, "endDate":endDate, "dueDate":dueDate, "complete":false])
                    localRealm.add(newTask)
                    getProjects()
                    print("add new task to realm: \(newTask)")
                }
            } catch{
                print("errow adding new task to realm: \(error)")
            }
        }
    }
    
    func getProjects(){
        if let localRealm = localRealm {
            let allProjects = localRealm.objects(Project.self)
            projects = []
            allProjects.forEach{project in
                projects.append(project)
            }
        }
    }
    
    func updateProject(id:ObjectId, complete:Bool){
        if let localRealm = localRealm {
            do{
                let projectToUpdate = localRealm.objects(Project.self).filter(NSPredicate(format: "id == %@", id))
                guard !projectToUpdate.isEmpty else{return}
                
                try localRealm.write {
                    projectToUpdate[0].complete = complete
                    getProjects()
                    print("update successful with id: \(id)")
                }
            } catch {
                print("errow updating task to realm: \(error)")
            }
        }
    }
    
    func deleteProject(id:ObjectId){
        if let localRealm = localRealm {
            do{
                let projectToDelete = localRealm.objects(Project.self).filter(NSPredicate(format: "id == %@", id))
                guard !projectToDelete.isEmpty else{return}
                
                try localRealm.write {
                    localRealm.delete(projectToDelete)
                    getProjects()
                    print("delete successful with id: \(id)")
                }
            } catch{
                print("errow deleting task to realm: \(error)")
            }
        }
    }
    
    func withinDuration(currentDate: Date, startDate:Date, dueDate:Date)-> Bool{

        let plusOneDay = Calendar.current.date(byAdding: .day,value: 1, to: currentDate)!
 
        return ((plusOneDay.compare(startDate) == .orderedDescending || plusOneDay.compare(startDate) == .orderedSame) && (currentDate.compare(dueDate) == .orderedAscending || currentDate.compare(dueDate) == .orderedSame))
    }
    
    func countCompletedTask()->Int{
        var completedProjects = 0
        for project in projects{
            if project.complete{
                completedProjects += 1
            }
        }
        return completedProjects
    }
    
    func isSameDay(date1: Date, date2:Date)-> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

