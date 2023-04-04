//
//  treeHole.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/10/13.
//

import SwiftUI

struct TreeHole: View {
    @EnvironmentObject var forum: TreeHoleForum
    @EnvironmentObject var forum2: Forum
    @EnvironmentObject private var login:loginViewModel
    @State var ispresented = false

    var body: some View {
        ZStack {
            ScrollView {
                ForEach(forum.pages) { page in
                    PostRow(forum: forum)
                        .environmentObject(page.follow_post[0])
                        .contentShape(Rectangle())
                        .onTapGesture {
                            toDetailPage(page: page)
                        }
                }
            }
            Spacer()
            Button(action: {
                self.ispresented = true
            }) {
                Image("Plus")
            }
            .sheet(isPresented: $ispresented) {
                NewPostTree(callPage: "main")
                    .environmentObject(forum)
            }
            .offset(x: 120, y: 250)
        }
        
    }
    
    func toDetailPage(page: PostPage) {
        if let window = UIApplication.shared.windows.first
        {
            window.rootViewController = UIHostingController(rootView: PostDetailTreeHole(page: page).environmentObject(forum).environmentObject(forum2).environmentObject(login))
            window.makeKeyAndVisible()
        }
    }
}

