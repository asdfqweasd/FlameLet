//
//  PostRow.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/27.
//
import SwiftUI
import Foundation

struct PostRow: View {
    @EnvironmentObject var post: Post
    var forum: Forum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.leading, 10.0)
                .frame(maxWidth: .infinity,alignment: .leading)
                
            Text(post.content)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.horizontal, 10)
            
            HStack {
                ForEach(post.getImageList(), id: \.self) { image in
                    Image(String(image))
                        .resizable()
                        .frame(width: 150, height: 100, alignment: .leading)
                }
            }
            
            HStack {
                Image("icon")
                    .resizable()
                    .frame(width: 16.0, height: 16)
                    .offset(x: 300)
                    .onTapGesture {
                        forum.likePost(post: post)
                    }
                Text("\(post.like)")
                    .font(.body)
                    .offset(x: 300)
            }
        }
        .frame(width: 350, height: 200, alignment: .center)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .padding(.top, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.ui.LoginColor, lineWidth: 0.5)
        )
        
    }
}


