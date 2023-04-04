//
//  ManagerRating.swift
//  DouBanDemo
//
//  Created by Keyu LI on 19/8/2022.
//

import SwiftUI

struct ManagerRating: View {
    var manager:Manager
    @EnvironmentObject var managerViewModel:ManagerViewModel
    @State var showCommentPage = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Manager Information")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 25).bold())

                
                HStack{
                    ManagerView(manager: self.manager)
                }
                .offset(x:-20)
                
                Text("Comments:")
                    .offset(x:-100)
                    .font(.system(size: 22))
                
                //looping each comment from manager
                ScrollView(.vertical){
                    ForEach(managerViewModel.getManager(manager: manager).comments.split(separator: ","),id: \.self){ comment in
                        Text(comment)
                            .frame(width: 300, height: 100, alignment: .leading)
                            .padding(.horizontal, 14.0)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(30)
                            .lineLimit(3)
                    }
                    
                    
                }
                
                
                Button("Add"){
                    showCommentPage.toggle()
                }
                .font(.system(size: 20).bold())
                .padding(.horizontal, 15)
                .padding(.vertical,10)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(30)
                
                
            }
            
            if(showCommentPage){
                Color.white.edgesIgnoringSafeArea(.all)
                WriteRating(manager: self.manager, rating: 0, userInput: "")
                    .environmentObject(managerViewModel)
            }
        }
        
        
        
            
                
    }

        
                
        
}



