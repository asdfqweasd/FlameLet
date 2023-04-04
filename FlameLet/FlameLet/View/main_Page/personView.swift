//
//  personView.swift
//  FlameLet
//
//  Created by Keyu LI on 17/10/2022.
//

import SwiftUI

struct personView: View {
    var manager:Manager

    var body: some View {
        HStack{
            Spacer()
            VStack{
                HStack{
                    Text("You May Know")
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding(.leading,20)

                    
                    
                }

                
                HStack(alignment: .center){

                    VStack(alignment:.center){
                        Image(manager.Image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
         
                        Text(manager.position)
                            .font(.subheadline)
                            .offset(y: -18)
                    }
                    .frame(maxWidth:.infinity )

                    VStack(alignment: .leading){
                        Text("Name: " + manager.name)
                            .font(.subheadline)
                        Text("Age: \(manager.age)")
                            .font(.subheadline)
                        Text("Gender: \(manager.gender)")
                            .font(.subheadline)
                        HStack{
                            Text("Rater: ")
                                .font(.subheadline)
                            
                            ForEach(1 ... 5, id: \.self){ index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 10, height:10)
                                        .foregroundColor(index > manager.averageRating ? Color.gray : Color.yellow)
                            }

                        }
                        .padding(.top, -10.0)
                        
                    }
                    .frame(maxWidth:.infinity )
                    .offset(x:-10)
                    
                }
                .frame(maxWidth:.infinity )
                .background(Color.ui.Grey)
                .cornerRadius(15)
                
            }
            .padding(.vertical, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.ui.LoginColor, lineWidth: 2)
            )
            
            
            Spacer()
        }
        

    }

}

