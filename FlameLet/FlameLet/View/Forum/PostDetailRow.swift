//
//  PostDetailRow.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/29.
//

import Foundation
import SwiftUI

struct PostDetailRow: View {
    var post:Post
    @State var offsetX: CGFloat = 20
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.content)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
            Spacer()
            HStack {
                ForEach(post.getImageList(), id: \.self) { image in
                    Image(String(image))
                        .resizable()
                        .frame(width: 150, height: 100, alignment: .leading)
                }
            }
            HStack {
                Text(post.fakeName)
                    .font(.caption)
                    .padding(.leading, 20.0)
                Spacer()
                Image("comment")
                    .resizable()
                    .frame(width: 16, height: 16)
                Image("icon")
                    .resizable()
                    .frame(width: 16.0, height: 16)
                    .offset(x: -10)
                Text("\(post.like)")
                    .font(.body)
                    .offset(x: -10)
            }
        }
        .frame(width: 350, height: CGFloat(140 + offsetX * CGFloat(ceil(Float(post.content.count)/Float(30)))), alignment: .center)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .padding(.top, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.ui.LoginColor, lineWidth: 0.5)
        )
    }
}


