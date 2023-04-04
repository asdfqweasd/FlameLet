//
//  receivedCommentView.swift
//  FlameLet
//
//  Created by Keyu LI on 17/10/2022.
//

import SwiftUI

struct receivedCommentView: View {
    var manager:Manager
    var body: some View {
        HStack{
            Spacer()
            Group{
                VStack{
                    HStack{
                        Text("Received Comment")
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.leading,10)
                        

                        
                    }
                    
                    

                    Text("\(getFirstComment(manager:manager))")
                        .font(.system(size: 14))
                        .padding(.horizontal,20)
                        .padding(.vertical, 10)
                        .background(.orange)
                        .cornerRadius(15)
                }
            }
            .padding(.vertical, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.ui.LoginColor, lineWidth: 2)
            )
            
            Spacer()
        }
        
    }
    
    func getFirstComment(manager:Manager) -> String{
        var first = ""
        for comment in manager.comments.split(separator: ","){
            first = String(comment)
            break
        }
        return first
    }
}

