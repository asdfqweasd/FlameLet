//
//  managerClass.swift
//  DouBanDemo
//
//  Created by Keyu LI on 31/8/2022.
//
import SwiftUI

class Manager:Decodable, Encodable, Identifiable{
    let _id : String
    let name: String
    let age: Int
    let gender: String
    var totalRating: Int
    var ratingTime: Int
    var averageRating: Int
    let position: String
    let Image: String
    var comments: String
    var email: String
    var password_hash: Int

    init(_id:String, name:String, age:Int, gender:String, totalRating:Int, ratingTime:Int, averageRating:Int, position:String, Image:String, comment:String, email:String, password_hash:Int){

        self._id = _id
        self.name = name
        self.age = age
        self.gender = gender
        self.totalRating = totalRating
        self.ratingTime = ratingTime
        self.averageRating = averageRating
        self.position = position
        self.Image = Image
        self.comments = comment
        self.email = email
        self.password_hash = password_hash

    }
}
