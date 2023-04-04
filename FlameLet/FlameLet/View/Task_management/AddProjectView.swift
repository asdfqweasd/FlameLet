//
//  AddProjectView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import SwiftUI

struct AddProjectView: View {
    @EnvironmentObject var projectManager:ProjectManager
    @State var projectTitle:String = ""
    @State var startDate:Date = Date()
    @State var endDate:Date = Date()
    @State var dueDate:Date = Date()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new project")
                .font(.title3.bold())
                .frame(maxWidth:.infinity, alignment: .leading)
            
            TextField("Enter your project here!", text: $projectTitle)
                .textFieldStyle(.roundedBorder)
            
            Section{
                DatePicker("Start Date: ",selection: $startDate,displayedComponents: [.date])
                    .frame(width: 250)

                
                DatePicker("End Date: ",selection: $endDate,displayedComponents: [.date])
                    .frame(width: 250)
   
                
                DatePicker("Due Date: ",selection: $dueDate,displayedComponents: [.date])
                    .frame(width: 250)
            }
            .offset(x:60)
            
            
            Button{
                if projectTitle != "" {
                    projectManager.addProject(ProjectTitile: projectTitle, startDate: startDate, endDate: endDate, dueDate: dueDate)
                }
                dismiss()
                
            }label: {
                Text("Submit")
                    .font(.title2.bold())
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


