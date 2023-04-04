//
//  HomeView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 5/10/2022.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var login:loginViewModel
    @EnvironmentObject var forum: Forum
    @EnvironmentObject var treeHole: TreeHoleForum
    
    @EnvironmentObject var taskManager: TaskManager
    @EnvironmentObject var projectManager: ProjectManager
    @Binding var currentDate: Date
    
    var titleContent: String
    
    var body: some View {
        
        ScrollView {
            Spacer()
            Spacer()
            TaskWithFlemateView(currentDate: $currentDate)
                .environmentObject(taskManager)
                .environmentObject(projectManager)
            HStack {
                Spacer()
                VStack{
                    HStack {
                        Text("New Post")
                            .font(.headline)
                            .padding(.leading, 10)
                        Spacer()

                    }
                    .padding(10)
                    VStack {
                        Rectangle()
                            .frame(width: 360, height: 2, alignment: .center)
                            .foregroundColor(Color.ui.Grey)
                            .offset(y: -10)
                        Text(String(titleContent.split(separator: ",")[0]))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(2)
                            .padding(.horizontal, 10)
                        Text(String(titleContent.split(separator: ",")[1]))
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .lineLimit(3)
                            .padding(.horizontal, 10)
                        Spacer()
                        

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
                .padding(.bottom, 15)
                .padding(.top, 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.ui.LoginColor, lineWidth: 2)
                )
                Spacer()
            }


            Spacer()
            
            personView(manager: login.currentUser!)

            
            Spacer()
            receivedCommentView(manager: login.currentUser!)

                
        }
        
    }
    
    func toListPage() {
        if let window = UIApplication.shared.windows.first
        {
            window.rootViewController = UIHostingController(rootView: PostList().environmentObject(forum).environmentObject(treeHole))
            window.makeKeyAndVisible()
        }
    }
}


