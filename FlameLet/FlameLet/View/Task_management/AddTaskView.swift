//
//  AddTaskView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 28/9/2022.
//

import SwiftUI
//Reference
//Build a SwiftUI to-do app from scratch with Realm Crash Course. (n.d.). Www.youtube.com. Retrieved October 18, 2022, from https://www.youtube.com/watch?v=b6q9vKaXtoU

struct AddTaskView: View {
    @EnvironmentObject var taskManager:TaskManager
    @State var taskTitle:String = ""
    @Environment(\.dismiss) var dismiss
    @Binding var currentDate:Date

    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title3.bold())
                .frame(maxWidth:.infinity, alignment: .leading)
            
            TextField("Enter your task here!", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            
            Button{
                if taskTitle != "" {
                    taskManager.addTask(taskTitile: taskTitle, date: currentDate)
                }
                dismiss()
                
            }label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.green)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)

            
            
        
    }
}


