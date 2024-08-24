//
//  loginView.swift
//  practice 2
//
//  Created by Quynh Tram on 11/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack (spacing: 0) {
                
                    // header
                    
                    headerView(title: "Welcome to Leaf", subtitle: "Login !")
                    
                    // login form
                
                
                    Form {
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.blue)
                        }
                        
                        TextField("username", text: $viewModel.username)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        SecureField("password", text: $viewModel.password)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        LFButton(title: "sign in", action: {
                            viewModel.login()
                        })
                        
                        .frame(height: 70)
                        
                        
                    }
                    
                    .offset(y: 25)
                    .background(Color(red: 0.621, green: 0.789, blue: 0.656))
                    .scrollContentBackground(.hidden)
                    
                    
                    // create account
                    
                
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                            .ignoresSafeArea()
                        
                        VStack (spacing: 0) {
                            
                        
                        
                        Text("New to Leaf?")
                                .foregroundColor(Color(hue: 0.346, saturation: 0.333, brightness: 0.536))
                                .bold()
                            NavigationLink("sign up here !", destination: createAccountView())
                                .accentColor(.white)
                                .buttonStyle(.bordered)
                        
                        // user agreement
                        
                       
                            
                        Text("By signing into Leaf you agree to our User Agreement.")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .offset(y: 80)

                        
                    }
                    
                    
                                        
                }
                        
                        
                        
            }
            }
            
        }
        }
#Preview {
    LoginView()
}

struct LoginView_Previews: PreviewProvider  {
    static var previews: some View {
        LoginView()
    }
}

