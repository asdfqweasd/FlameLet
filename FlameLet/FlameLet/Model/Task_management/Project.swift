//
//  Project.swift
//  DouBanDemo
//
//  Created by Keyu LI on 29/9/2022.
//

import Foundation
import RealmSwift

class Project:Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:ObjectId
    @Persisted var title:String = ""
    @Persisted var startDate: Date
    @Persisted var endDate: Date
    @Persisted var dueDate: Date
    @Persisted var complete:Bool
}
