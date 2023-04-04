//
//  SingleProjectView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import SwiftUI

struct SingleProjectView: View {
    var project:Project
    var body: some View {
        HStack(spacing: 10){
            
            Image(systemName:project.complete ? "checkmark.square" : "square")
                .foregroundColor(.yellow)
            
            Text(project.title)
                .font(.system(size: 15))
        }
        .padding(.vertical, 2)
        .padding(.horizontal)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}


