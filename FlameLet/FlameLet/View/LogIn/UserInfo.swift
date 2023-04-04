//
//  UserInfo.swift
//  FlameLet
//
//  Created by Zihao Song on 16/10/2022.
//

import SwiftUI

struct UserInfo: View {
//    var manager: Manager
    
    var body: some View {
        HStack {
            Image("ID5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            VStack {
                Text("Hello, Flora")
                Text("Well done today!")
            }
            .padding(.leading, 20)
        }
        .padding(10)
        VStack {

            Rectangle()
                .frame(width: 300, height: 100, alignment: .center)
                .cornerRadius(20)
        }
        
    }
}

