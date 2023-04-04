//
//  TaskAchievementsView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import SwiftUI

struct TaskAchievementsView: View {
    @EnvironmentObject var taskManager:TaskManager
    @EnvironmentObject var projectManager:ProjectManager

    var body: some View {
        
        VStack{
            HStack{
                Text("Achievements")
                    .font(.title2)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.leading,15)
                    
                
                Image(systemName: "chevron.right")
                    .frame(width:60,alignment: .trailing)
                    .padding(.trailing,15)

            }
            .padding()
            
            Spacer()
            HStack(spacing:50){
                VStack{
                    Text("Tasks")
                        .padding(.bottom, 10)
                    
                    Text("\(taskManager.countCompletedTask())")
                }
                VStack{
                    Text("Project")
                        .padding(.bottom, 10)
                    
                    Text("\(projectManager.countCompletedTask())")
                }
                VStack{
                    Text("Working time")
                        .padding(.bottom, 10)
                    Text("0 H")
                }
            }
            Spacer()
        }
        .frame(width: .infinity, height: 200, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth:2))
        
    }
    

}


