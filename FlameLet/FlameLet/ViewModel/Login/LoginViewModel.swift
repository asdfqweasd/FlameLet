//
//  LoginViewModel.swift
//  FlameLet
//
//  Created by 范俊益 on 2022/10/15.
//

import Foundation
import Alamofire


class loginViewModel:ObservableObject{
    @Published var currentUser:Manager?
    @Published var loginStatus:Int = 0
    
    
    func hashcode(password: String) -> Int {
        var result = 0;
        var temp_result = 0;
        let c = 17;
        
        for code in password.unicodeScalars {
            temp_result = Int(code.value) * c;
            result = result + temp_result;
        }

        
        return result;

    }
    
    
    func verifyInfo(userName:String, password:String) {
        
        let passwordHash = hashcode(password: password);
            
            
            
            guard let url = URL(string: "http://localhost:8081/verifylogin") else {
                print("Your API end point is Invalid")
                return
            }
            
            var request = URLRequest(url: url);
            request.httpMethod = "GET";
            request.setValue(userName, forHTTPHeaderField: "email");
            request.setValue("\(passwordHash)", forHTTPHeaderField: "password_hash");

            URLSession.shared.dataTask(with: request) { data, response, error in
                let response2 = try! JSONDecoder().decode(Manager.self, from: data!)
                    DispatchQueue.main.async {
                        self.currentUser = response2;
                    }
             
            }.resume()
    }

}

extension StringProtocol {
    func slice(_ start: Int, _ end: Int) -> SubSequence {
        let lower = index(self.startIndex, offsetBy: start)
        let upper = index(lower, offsetBy: end - start)
        return self[lower...upper]
    }
}
