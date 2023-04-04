//
//  PostDetail.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/28.
//

import Foundation
import SwiftUI

struct PostDetailTreeHole: View {
    var page: PostPage
    @EnvironmentObject var forum1: TreeHoleForum
    @EnvironmentObject var forum2: Forum
    @EnvironmentObject private var login:loginViewModel
    @State var ispresented = false
    @State var tab: Int = 2

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: toListPage) {
                        Label("Back", systemImage: "chevron.left")
                    }
                    .frame(width: 90, height: 20, alignment: .leading)
                    .offset(x: -25)
                    Text(page.title)
                        .frame(width: 200, height: 20, alignment: .leading)
                        .offset(x: -45)
                }
                .font(.headline)
                .frame(width: 380, height: 40, alignment: .center)
                .padding(10)
                .background(Color.ui.Grey)
                ScrollView {
                    VStack {
                        ForEach(page.follow_post){post in
                            PostDetailRow(post: post)
                        }
                    Spacer()
                    }
                    .frame(height: 600.0)
                }
            }
            Button(action: {
                self.ispresented = true
            }) {
                Image("icon")
            }
            .sheet(isPresented: $ispresented) {
                NewPostTree(callPage: page.id)
                    .environmentObject(forum1)
            }
            .offset(x: 120, y: 250)
        }
        
    }
    
    func toListPage() {
        if let window = UIApplication.shared.windows.first
        {
            window.rootViewController = UIHostingController(rootView: Home(showingTab: $tab).environmentObject(login))
            window.makeKeyAndVisible()
        }
    }
}






