//
//  NewPostTest.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/10/13.
//

import Foundation

import SwiftUI


struct NewPostTest: View {
    @EnvironmentObject var forum: Forum
    @Environment(\.presentationMode) var mode
    var callPage: String
    @State private var titleText = "Please input your title"
    @State private var contentText = "Share what you want to say"
    
    var body: some View {
        VStack {
            Image("downArrow")
                .resizable()
                .frame(width: 45, height: 22.08, alignment: .center)
                .offset(y: -25)
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.headline)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundColor(.white)
                TextEditor(text: $titleText)
                    .keyboardType(.phonePad)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text("Content")
                    .font(.headline)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundColor(.white)
                TextEditor(text: $contentText)
                    .keyboardType(.phonePad)
                    .frame(width: 300, height: 450, alignment: .leading)
                    .cornerRadius(10)
                    .padding(.bottom, 30)
            }
            Button("Submit", action: {
                if callPage == "main" {
                    forum.createPost(title: titleText, content: contentText, like: 0, poster: "test3_poster", imageIDs: "ID2")
                } else {
                    forum.createNormalPost(title: titleText, content: contentText, like: 0, poster: "test3_poster", dependency: callPage, imageIDs: "ID3")
                }
                
            })
            .foregroundColor(.white)
            .font(.system(size: 15).bold())
            .frame(width: 100, height: 50, alignment: .center)
            .background(Color.ui.LoginColor)
            .cornerRadius(25)
        }
        .frame(width: 390, height: 810, alignment: .center)
        .edgesIgnoringSafeArea(.all)
        .background(
            Color.ui.FlameOrange
                .ignoresSafeArea(.all, edges: .vertical)
                .onTapGesture {
                    withAnimation {
                        self.mode.wrappedValue.dismiss()
                    }
                }
        )
        .cornerRadius(20)
        .offset(y: 20)
    }
}
