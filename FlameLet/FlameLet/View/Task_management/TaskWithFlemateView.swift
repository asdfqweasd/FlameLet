//
//  TaskWithFlemateView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import SwiftUI

struct TaskWithFlemateView: View {
    @EnvironmentObject var taskManager:TaskManager
    @EnvironmentObject var projectManager:ProjectManager
    @Binding var currentDate: Date
    @State var bigger:Bool = false
    @State var sentenceIndex:Int = 0
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                ZStack{
                    
                    VStack{
                        VStack(spacing: 2){
                            Text("Hi, I’m FlametLet!")
                                .frame(width: 210,alignment: .leading)
                            if taskManager.countIncompletedTask(today: currentDate) == 0{
                                Text("Contratulation!")
                                    .frame(width: 210,alignment: .leading)
                                Text(" You have completed all the task")
                                    .frame(width: 250)
                                    .offset(x:12)
                            } else{
                                
                                Text("You have \(taskManager.countIncompletedTask(today: currentDate)) mini tasks to go.")
                                Text("Don’t forget to take breaks!")
                            }
                            
                        }
                        .padding(.top,9)
                        .frame(maxWidth: .infinity)
                        .offset(x:5)
                        

                        VStack(spacing: 2){
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.orange)
                                
                                Text("TODAY")
                                    .foregroundColor(.orange)
                                    .font(.caption)
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.vertical,5)
                            
                            
                            showTask()
                                .padding(.bottom,10)
                            
                            Text("Project")
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .padding(.horizontal,5)
                                .foregroundColor(.orange)
                                .font(.system(size: 15).bold())
                            
                            showProject()
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal,30)
                        
                        
                        Spacer()
                    }
                    .frame(width:.infinity, height: 250, alignment: .leading)
                    
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.ui.LoginColor, lineWidth:2))
                    

                    FlameLetView(sentenceIndex: $sentenceIndex,bigger: $bigger)
                        .frame(width: 70, height: 90)
                        .offset(x: -150, y: -130)
                        .onTapGesture {
                            bigger.toggle()
                        }

                    
                    
                }
                Spacer()
            }
        }
        .padding(.top,40)
        
        
        
    }
    
    @ViewBuilder
    func showTask()->some View{

            ForEach(taskManager.tasks){ task in
                if taskManager.isSameDay(date1: task.taskDate, date2: currentDate){
                    SingleTaskView(task: task)
                    //press task to modify the completed state
                        .onTapGesture {
                            taskManager.updateTask(id: task.id, complete: !task.complete)

                            sentenceIndex = Int(arc4random() % 10)

                            
                        }
                    //press task for 0.1 second, the task will be deleted
                        .onLongPressGesture(minimumDuration: 0.1) {
                            
                            taskManager.deleteTask(id: task.id)
                                    
                        }
                }
            }
    }
    
    @ViewBuilder
    func showProject()->some View{

        ForEach(projectManager.projects){ project in
            let show = projectManager.withinDuration(currentDate: currentDate, startDate: project.startDate, dueDate: project.endDate)
            if show{
                SingleProjectView(project: project)
                //press task to modify the completed state
                    .onTapGesture {
                        projectManager.updateProject(id: project.id, complete: !project.complete)
                        sentenceIndex = Int(arc4random() % 10)
                    }
                //press task for 0.1 second, the task will be deleted
                    .onLongPressGesture(minimumDuration: 0.1) {

                        projectManager.deleteProject(id: project.id)
                                
                    }
                }
            }
    }
}

