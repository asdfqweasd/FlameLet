//
//  Task.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import Foundation
import RealmSwift

class Task:Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:ObjectId
    @Persisted var title:String = ""
    @Persisted var taskDate: Date
    @Persisted var complete:Bool
}
    

