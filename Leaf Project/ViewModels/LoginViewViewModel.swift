//
//  LoginViewViewModel.swift
//  practice 2
//
//  Created by Quynh Tram on 11/14/23.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}
    
    func login() {
        errorMessage = ""
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all fields!"
            
            return
            
            
        }
        
        print("Called")
    }
    
    func validate() {
        
    }
}
