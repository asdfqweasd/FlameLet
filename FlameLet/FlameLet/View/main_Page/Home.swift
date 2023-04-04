//
//  navBarView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 12/10/2022.
//

import SwiftUI

struct Home: View {
    var showingTab: Binding<Int>
    @StateObject var shareTime:Forum = Forum()
    @StateObject var treeHole: TreeHoleForum = TreeHoleForum()
    @EnvironmentObject private var login:loginViewModel
    @StateObject var taskManager = TaskManager()
    @StateObject var projectManager = ProjectManager()
    @State var currentDate:Date = Date()
    
    var body: some View {
        TabView(selection: showingTab){
            
            MainPage(currentDate: $currentDate, titleContent: getRandomPostTitleContent())
                .environmentObject(shareTime)
                .environmentObject(treeHole)
                .environmentObject(taskManager)
                .environmentObject(projectManager)
                .environmentObject(login)
                .tabItem{
                    Image(systemName:"house")
                    Text("Home")
                }
                .tag(1)
            
            PostList().environmentObject(shareTime)
                .environmentObject(treeHole)
                .environmentObject(login)
                .tabItem{
                    Image(systemName:"message")
                    Text("Forums")
                }
                .tag(2)
            
            
            TaskManagerView().environmentObject(taskManager)
                .environmentObject(projectManager)
                .tabItem{
                    Image(systemName:"clock")
                    Text("Task")
                }
                .tag(3)
            
            ManagerRatingList()
                .tabItem{
                    Image(systemName: "star")
                    Text("Rater")
                }
                .tag(4)
            
            
            
        }
    }
    func getRandomPostTitleContent() -> String {
        var title = " "
        var content = " "
        var images = " "
        for post in shareTime.posts {
            title = post.title
            content = post.content
            images = post.imageIDs
            break
        }
        return title + "," + content + "," + images
    }
}


