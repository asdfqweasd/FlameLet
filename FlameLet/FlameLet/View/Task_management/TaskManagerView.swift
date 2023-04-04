//
//  TaskManagerView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct TaskManagerView: View {

    @EnvironmentObject var taskManager: TaskManager
    @EnvironmentObject var projectManager: ProjectManager

    @State var currentDate:Date = Date()
    @State var showCalendar:Bool = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack{
                    TaskWithFlemateView(currentDate: $currentDate)
                        .environmentObject(taskManager)
                        .environmentObject(projectManager)

                    
                    Button{
                        showCalendar.toggle()
                    }label: {
                        Label("Add Task",systemImage: "plus.circle")
                            .font(.body.bold())
                            .padding(6)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .offset(y:125)
                
                }
      
                Spacer()
                Spacer()
                
                HStack{
                    Spacer()
                    TaskAchievementsView()
                        .environmentObject(taskManager)
                        .environmentObject(projectManager)
                        .offset(y:-30)
                    
                    Spacer()
                }

                Spacer()
            
                HStack{
                    Spacer()
                    VStack{
                        HStack{
                            Text("Calendar")
                                .font(.title2)
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .padding(.leading,15)
                                
                            
                            Image(systemName: "chevron.right")
                                .frame(width:60,alignment: .trailing)
                                .padding(.trailing,15)
                                .onTapGesture {
                                    showCalendar.toggle()
                                }
                        }

                        
                        
                        Text("Looking back at previous achievements.")
                        
                    }
                    .frame(width: .infinity, height: 100, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth:2))
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            
            

            
            if(showCalendar){
                Color.white.edgesIgnoringSafeArea(.all)
                CalendarAddTaskView(currentDate: $currentDate)
                    .environmentObject(taskManager)
                    .environmentObject(projectManager)
            }
        }
     
    }
}


