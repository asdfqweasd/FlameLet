//
//  starRating.swift
//  DouBanDemo
//
//  Created by Keyu LI on 24/8/2022.
//

import SwiftUI

//Reference
//Hudson @twostraws, P. (n.d.). Adding a custom star rating component - a free Hacking with iOS: SwiftUI Edition tutorial. Hacking with Swift. Retrieved October 18, 2022, from https://www.hackingwithswift.com/books/ios-swiftui/adding-a-custom-star-rating-component

struct starRating: View {
    @Binding var rating: Int
    var lable = ""
    var maximumRating = 5
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if lable.isEmpty == false {
               Text(lable)
            }
            
            ForEach(1 ..< maximumRating + 1, id: \.self){ number in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height:20)
                        .padding(.trailing, 5.0)
                        .foregroundColor(number > rating ? offColor : onColor)
                        .onTapGesture {
                        rating = number
                        }
            }
        }

    }
    
}


