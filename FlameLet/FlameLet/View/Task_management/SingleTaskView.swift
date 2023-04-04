//
//  SingleTaskView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 28/9/2022.
//

import SwiftUI

struct SingleTaskView: View {

    var task:Task
    var body: some View {
        HStack(spacing: 10){
            
            Image(systemName:task.complete ? "checkmark.square" : "square")
                .foregroundColor(.yellow)
            
            Text(task.title)
                .font(.system(size: 15))
        }
        
        .padding(.vertical, 2)
        .padding(.horizontal)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}


