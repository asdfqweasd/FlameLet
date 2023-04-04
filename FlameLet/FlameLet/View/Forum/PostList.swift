//
//  PostList.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/28.
//

import Foundation
import SwiftUI

struct PostList: View {

    @EnvironmentObject var shareTime: Forum
    @EnvironmentObject var treeHole: TreeHoleForum
    @EnvironmentObject private var login:loginViewModel
    @State var ispresented = false
    @State var offsetX = CGFloat(-80)
    
    var body: some View {
        ZStack {
            VStack {
                Text("Shanti Annoymous Forum")
                    .font(.headline)
                    .frame(width: 380, height: 40, alignment: .center)
                    .padding(10)
                    .background(Color.ui.Grey)
                VStack {
                    HStack {
                        Text("Share Time")
                            .font(.body)
                            .frame(width: 150, height: 20, alignment: .center)
                        Text("Tree Hole")
                            .font(.body)
                            .frame(width: 150, height: 20, alignment: .center)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.ui.Grey)
                    .offset(y: -10)
                    Rectangle()
                        .fill(Color.ui.FlameOrange)
                        .frame(width: 80, height: 5, alignment: .leading)
                        .offset(x: offsetX, y: -18)
                }
                TabView {
                    ShareTime().environmentObject(shareTime)
                        .environmentObject(treeHole)
                        .environmentObject(login)
                        .onAppear(perform: {
                            offsetX = -80
                        })
                    TreeHole().environmentObject(treeHole)
                        .environmentObject(shareTime)
                        .environmentObject(login)
                        .onAppear(perform: {
                            offsetX = 80
                        })
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}
