//
//  PostPage.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/29.
//

import Foundation

class PostPage: Codable, Identifiable, ObservableObject {
    var id: String
    var title: String
    var content: String
    var follow_post = [Post]()
    var name_1 = ["happy", "crazy", "burning", "silly", "naughty", "chill", "pretty"]
    var name_2 = ["Jumping", "Climbing", "Flying", "Knocking", "Waving", "Driving", "Playing"]
    var name_3 = ["Hammer", "Gear", "Valve", "Camera", "Fox", "Book", "Keyboard"]
    var name_used = [String]()
    
    init(post: Post) {
        self.id = post._id
        self.title = post.title
        self.content = post.content
        self.assignName(post: post)
        self.follow_post.append(post)
    }
    
    func addPost(post: Post) {
        self.follow_post.append(post)
        if post.fakeName.isEmpty {
            self.assignName(post: post)
        }
    }
    
    func assignName(post: Post) {
        while true {
            let randomNumber_1 = Int.random(in: 0...6)
            let randomNumber_2 = Int.random(in: 0...6)
            let randomNumber_3 = Int.random(in: 0...6)
            
            let fakeName = name_1[randomNumber_1] + name_2[randomNumber_2] + name_3[randomNumber_3]
            
            if !(name_used.contains(fakeName)) {
                name_used.append(fakeName)
                post.assignFakeName(fakeName: fakeName)
                break
            }
        }
    }

    
}
