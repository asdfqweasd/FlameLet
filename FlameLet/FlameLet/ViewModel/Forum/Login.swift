//
//  Login.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/10/4.
//

import Foundation
import SwiftUI

class Login: ObservableObject {
    var name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    func checkValidation(name: String, password: String) {
        return
    }
}


