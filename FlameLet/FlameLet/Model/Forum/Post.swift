//
//  Post.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/27.
//
import SwiftUI
import Foundation

class Post:Decodable, Encodable, Identifiable, Equatable, ObservableObject {
    static func == (lhs: Post, rhs: Post) -> Bool {
        if lhs._id == rhs._id {
            return true
        } else {
            return false
        }
    }
    
    let _id: String
    let title: String
    let content: String
    var like: Int
    let poster: String
    var dependency: String
    let imageIDs: String
    var fakeName: String


    func likePost() {
        self.like = self.like + 1
    }
    
    func assignFakeName(fakeName: String) {
        self.fakeName = fakeName
    }
    
    func getImageList() -> Array<Substring> {
        let imagelist = self.imageIDs.split(separator: ",")
        return imagelist
    }
}
