//
//  NavigationBarView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 5/10/2022.
//

import SwiftUI

struct NavigationBarView: View {
    @State var home:Bool = false
    @State var task:Bool = false
    @State var rator:Bool = false
    @State var forum:Bool = false
    @State var me:Bool = false
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                VStack{
                    Image(systemName:"house")
          
                    Text("Home")
                }
                .foregroundColor(home ? Color.orange : Color.gray)
                .onTapGesture {
                    home.toggle()
                    task = false
                    rator = false
                    forum = false
                    me = false
                }
                
                
                Spacer()
                VStack{
                    Image(systemName:"clock")
    //                Spacer()
                    Text("Task")
                }
                .foregroundColor(task ? Color.orange : Color.gray)
                .onTapGesture {
                    task.toggle()
                    home = false
                    rator = false
                    forum = false
                    me = false
                }
                
                Spacer()
                VStack{
                    Image(systemName: "star")
    //                Spacer()
                    Text("Rater")
                }
                .foregroundColor(rator ? Color.orange : Color.gray)
                .onTapGesture {
                    rator.toggle()
                    task = false
                    home = false
                    forum = false
                    me = false
                }
                forumMe()
        
            }
            .frame(width: .infinity, height: 60)
            .font(.system(size: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth:2))
            
            if home{
                Color.white.edgesIgnoringSafeArea(.all)
                MainPage()
            }
            
            if rator{
                Color.white.edgesIgnoringSafeArea(.all)
                ManagerRatingList()
            }
            
            if task{
                Color.white.edgesIgnoringSafeArea(.all)
                TaskManagerView()
            }
        }
        
        

    }
    
    @ViewBuilder
    func forumMe()->some View{
        Spacer()
        VStack{
            Image(systemName:"message")
//            Spacer()
            Text("Forums")
        }
        .foregroundColor(forum ? Color.orange : Color.gray)
        .onTapGesture {
            forum.toggle()
            task = false
            rator = false
            home = false
            me = false
        }
        
        Spacer()
        VStack{
            Image(systemName: "person.circle")
//            Spacer()
            Text("Me")
        }
        .foregroundColor(me ? Color.orange : Color.gray)
        .onTapGesture {
            me.toggle()
            task = false
            rator = false
            forum = false
            home = false
        }
        Spacer()
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
