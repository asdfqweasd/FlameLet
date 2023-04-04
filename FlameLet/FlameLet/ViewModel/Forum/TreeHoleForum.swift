//
//  Forum.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/29.
//

import Foundation
import Alamofire


class TreeHoleForum: Forum {
    
    override func getPost() {
        guard let url = URL(string: "http://localhost:8081/fetchtreehole") else {
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
    
    override func createPost(title: String, content: String, like: Int, poster: String, imageIDs: String) {
        AF.request("http://localhost:8081/createmaintreehole", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "content": content,
                                                                                                                "like": "\(like)","poster": poster, "imageIDs": imageIDs, ]).responseJSON {
            response in
            print("response:   ", response)
            self.getPost()
        }
    }
    
    override func createNormalPost(title: String, content: String, like: Int, poster: String, dependency: String, imageIDs: String) {
        AF.request("http://localhost:8081/createnormaltreehole", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "content": content,
                                                                                                                      "like": "\(like)","poster": poster, "dependency": dependency, "imageIDs": imageIDs, ]).responseJSON {
            response in
            print("response:   ", response)
            self.getPost()
        }
    }
    
    
    override func updatePost(id: String, title: String, content: String, like: Int, poster: String, dependency: String, imageIDs: String, fakeName: String) {
        AF.request("http://localhost:8081/updatetreehole", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id, "title": title, "content": content,
                                                                                                                "like": "\(like)","poster": poster, "dependency": dependency, "imageIDs": imageIDs, "fakeName": fakeName]).responseJSON {
            response in
            print(response)
            self.getPost()
        }
    }
    

    
}
