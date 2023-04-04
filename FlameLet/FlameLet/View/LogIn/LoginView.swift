//
//  LoginView.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/10/4.
//

import SwiftUI

struct LoginView: View {
    @StateObject var login:loginViewModel = loginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailValid: Bool = true
    @State private var passwordValid: Bool = true
    @State private var showHomePage:Bool = false
    @State var tab: Int = 1
    var body: some View {
        ZStack {
            Color.ui.FlameOrange
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("icon")
                    .padding(.bottom, 20.0)
                    .shadow(color: .black, radius: 2, x: 2, y: 1)
                Text("Log in your account")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                
                TextField("  Email Address",text: $email, onEditingChanged: { (isChanged) in
                    if !isChanged {
                        if isValidEmail(self.email){
                            self.emailValid = true
                        } else{
                            self.emailValid = false
                            self.email = ""
                        }
                    }
                    
                })
                .textFieldStyle(.plain)
                .foregroundColor(Color.black)
                .font(.system(size: 20))
                .cornerRadius(10)
                .frame(width: 300, height: 40, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.white, lineWidth: 1)
                )
                .padding(.horizontal, 50.0)
                .autocapitalization(.none)
            
                if !self.emailValid {
                    Text("Email is Not Valid")
                        .font(.callout)
                        .foregroundColor(Color.white)
                }
                
                
                
                
                
                SecureField("  Password", text: $password)
                .textFieldStyle(.plain)
                .font(.system(size: 20))
                .frame(width: 300, height: 40, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.white, lineWidth: 1)
                )
                .autocapitalization(.none)

                
                if !self.passwordValid {
                    Text("Password is Not Valid")
                        .font(.callout)
                        .foregroundColor(Color.white)
                }
                
                Button{
                    
                    if isPasswordValid(self.password){
                        self.passwordValid = true
                    } else{
                        self.passwordValid = false
                        self.password = ""
                    }
                    
                    
                    if self.passwordValid && self.emailValid{
                        
                       
                        login.verifyInfo(userName: email, password: password)
                        
                        
                    }
                    
                            if(login.currentUser?.name != nil) {
                                self.showHomePage = true
                            }

                    
                    
                } label: {
                    Text("Log in")
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.ui.LoginColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .buttonStyle(.plain)

            }
            .frame(height: 500.0)
            .offset(y: -120)
            
            
            if showHomePage{
                Color.white.edgesIgnoringSafeArea(.all)
                Home(showingTab: $tab)
                    .environmentObject(login)
            }
        }
        
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    private func isPasswordValid(_ password : String) -> Bool{
            let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
            return passwordTest.evaluate(with: password)
        }
}



