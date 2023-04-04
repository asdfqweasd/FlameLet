//
//  Forum.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/29.
//

import Foundation
import Alamofire
import SwiftUI

class Forum: ObservableObject {
    @Published var posts = [Post]()
    @Published var pages = [PostPage]()
    
    init() {        getPost()

    }
    
    func getPost() {
        guard let url = URL(string: "http://localhost:8081/fetchpost") else {
            print("Your API end point is invalid")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data!)
            let response2 = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                for item in response2 {
                    print("title before" + item.title)
                    if !(self.posts.contains { element in
                        if item._id == element._id {
                            if item.like != element.like{
                                if let index = self.posts.firstIndex(of: element) {
                                    self.posts.remove(at: index)
                                }
                                return false
                            } else {
                                return true
                            }
                        } else {
                            return false
                        }
                    }) {
                        print("title after" + item.title)
                        self.posts.append(item)
                    }
                }
                //build pages first with theme post
                for post in self.posts {
                    if post.dependency == post._id {
                        if !(self.pages.contains { element in
                            if post._id == element.id {
                                return true
                            } else {
                                return false
                            }
                        }) {
                            let newPage = PostPage(post: post)
                            print("added page is \(newPage.title)")
                            self.pages.append(newPage)
                        }
                    }
                }

                //add commentary posts into pages
                for post in self.posts {
                    for page in self.pages {
                        if post.dependency == page.id {
                            if !(page.follow_post.contains { element in
                                if post._id == element._id {
                                    return true
                                } else {
                                    return false
                                }
                            }) {
                                page.addPost(post: post)
                            }
                        }
                    }
                }
            }
        }.resume()
    }
    
    func createPost(title: String, content: String, like: Int, poster: String, imageIDs: String) {
        AF.request("http://localhost:8081/createmainpost", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "content": content,
                                                                                                                "like": "\(like)","poster": poster, "imageIDs": imageIDs, ]).responseJSON {
            response in
            print("response:   ", response)
            self.getPost()
        }
    }
    
    func createNormalPost(title: String, content: String, like: Int, poster: String, dependency: String, imageIDs: String) {
        AF.request("http://localhost:8081/createnormalpost", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "content": content,
                                                                                                                      "like": "\(like)","poster": poster, "dependency": dependency, "imageIDs": imageIDs, ]).responseJSON {
            response in
            print("response:   ", response)
            self.getPost()
        }
    }
    
    
    func updatePost(id: String, title: String, content: String, like: Int, poster: String, dependency: String, imageIDs: String, fakeName: String) {
        AF.request("http://localhost:8081/updatepost", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id, "title": title, "content": content,
                                                                                                                "like": "\(like)","poster": poster, "dependency": dependency, "imageIDs": imageIDs, "fakeName": fakeName]).responseJSON {
            response in
            print(response)
            self.getPost()
        }
    }

    func likePost(post: Post) {
        post.likePost()
        updatePost(id: post._id, title: post.title, content: post.content, like: post.like, poster: post.poster, dependency: post.dependency, imageIDs: post.imageIDs, fakeName: post.fakeName)
    }

    

    
}
