//
//  ManagerViewModel.swift
//  DouBanDemo
//
//  Created by Keyu LI on 1/9/2022.
//

import Foundation

import Alamofire


class ManagerViewModel: ObservableObject {
    @Published var ManagerList = [Manager]()
    
    
    init(){
        loadData()
    }
    
    
    func getList() -> [Manager]{
        return ManagerList
    }
    
    
    func loadData() {
                guard let url = URL(string: "http://localhost:8081/fetchmanager") else {
                    print("Your API end point is Invalid")
                    return
                }
                let request = URLRequest(url: url)

                URLSession.shared.dataTask(with: request) { data, response, error in
                    let response2 = try! JSONDecoder().decode([Manager].self, from: data!)
                    print(response2)
                    DispatchQueue.main.async {
                                                self.ManagerList = response2
                                            }
                    
                }.resume()
            }
        

    
    func updateCommentsAndRating(manager:Manager, input:String, rating:Int) {
        var temp = manager.comments
        temp.append(",")
        temp.append(input)
        
        let ratingTime = manager.ratingTime + 1
        let totalRating = manager.totalRating + rating
        let averageRating = totalRating / ratingTime

    
        AF.request("http://localhost:8081/updateManager", method:. post, encoding: URLEncoding.httpBody, headers: ["id": manager._id, "name": manager.name, "age": "\(manager.age)", "gender": manager.gender, "totalRating": "\(totalRating)", "ratingTime": "\(ratingTime)", "averageRating": "\(averageRating)", "position": manager.position, "Image": manager.Image, "comments": temp, "email": manager.email, "password_hash": "\(manager.password_hash)"]).responseJSON {
                    response in
                    print(response)
            self.loadData()
        }
    }
    
    func getManager(manager:Manager)-> Manager{
        var result = manager
        for temp in self.ManagerList{
            if manager._id == temp._id{
                 result = temp
            }
        }
        return result
    }
    
}

