//
//  CalendarAddTaskView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct CalendarAddTaskView: View {
    @EnvironmentObject var taskManager:TaskManager
    @EnvironmentObject var projectManager:ProjectManager
    @Binding var currentDate: Date
    @State var showAddTaskView = false
    @State var showAddProjectView = false
    @State var showTaskManagerView = false
    
    var body: some View {
        
        ZStack{
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing:20){
                    //calendar view
                    CalendarView(currentDate: $currentDate)
                        .environmentObject(taskManager)
                        .environmentObject(projectManager)
                }
                .padding(.vertical)
                
            }
            .safeAreaInset(edge: .bottom){
                HStack{
                    Button{
                        showTaskManagerView.toggle()
                    } label: {
                        Image(systemName: "return.left")
                            .padding(.vertical)
                            .frame(width:40)
                            .background(.green,in: Capsule())
                    }
                    
                    
                    Button{
                        showAddTaskView.toggle()
                        print(currentDate)
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(.orange,in: Capsule())
                    }
                    
                    Button{
                        showAddProjectView.toggle()
                    } label: {
                        Text("Add Project")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(.purple,in: Capsule())
                    }
                }
                .padding(.horizontal)
                .padding(.top,10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
            
            if(showTaskManagerView){
                Color.white.edgesIgnoringSafeArea(.all)
                TaskManagerView()
            }
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView(currentDate: $currentDate)
                .environmentObject(taskManager)
        }
        .sheet(isPresented: $showAddProjectView){
            AddProjectView()
                .environmentObject(projectManager)
        }
        
    }
}


