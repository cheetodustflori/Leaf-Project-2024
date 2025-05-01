//
//  loginView.swift
//
//  This file defines the login screen of the Leaf application
//  It handles user authentication and navigation to the main app screens

import SwiftUI
import Supabase  // Imports Supabase library for backend authentication services

struct LoginView: View {
    
    // MVVM architecture - ViewModel to handle business logic
    @StateObject var viewModel = LoginViewViewModel()
    
    // State variables to track login status and errors
    @State private var isLoggedIn = false  // Tracks if user is logged in
    @State private var errorMessage: String? = nil  // Stores authentication error messages
    
    
    var body: some View {
        
        NavigationView {  // Enables navigation between screens
            
            VStack (spacing: 0) {  // Main container with no spacing between elements
                
                // Header section
                headerView(title: "Welcome to Leaf", subtitle: "Login")
                    // Custom component that displays the app title and page subtitle
                    
                // Login form section
                Form {
                        
                        // Conditional error message display
                        if !viewModel.errorMessage.isEmpty { //Don't change
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.blue)  // Display error in blue text
                        }
                        
                        // Username input field
                        TextField("username", text: $viewModel.username)
                            .textFieldStyle(PlainTextFieldStyle())  // Simple text field with no decoration
                            .autocapitalization(.none)  // Prevents automatic capitalization
                            .autocorrectionDisabled()  // Disables autocorrect for username entry
                        
                        // Password input field with secure entry
                        SecureField("password", text: $viewModel.password)
                            .textFieldStyle(PlainTextFieldStyle())
                    
                        // Login Button
                        Button(action: {
                            viewModel.login()  // Calls the login method in the ViewModel
                        }) {
                            Text("Login")
                                .bold()
                                .frame(maxWidth: .infinity)  // Makes button take full width
                                .padding()
                                .background(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green background
                                .foregroundColor(.white)  // White text
                                .cornerRadius(8)  // Rounded corners
                        }
                        .padding()

                    } //Form
                    .frame(minHeight: 300)  // Sets minimum height for the form
                    .offset(y: 25)  // Positions form 25 points down
                    .background(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green background
                    .scrollContentBackground(.hidden)  // Hides default form background
                
                
                // Hidden NavigationLink to programmatically navigate on successful login
                NavigationLink(destination: missionTaskView(), isActive: $viewModel.isLoggedIn) {
                    EmptyView()  // No visible content for this link
                }
    
                    
                // Create account section (bottom of screen)
                ZStack {
                    
                    // Background for the bottom section
                    Rectangle()
                        .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green
                        .ignoresSafeArea()  // Extends beyond safe area
                    
                    VStack (spacing: 0) {  // Content container with no spacing
                        
                        // New user prompt
                        Text("New to Leaf?")
                            .foregroundColor(Color(hue: 0.346, saturation: 0.333, brightness: 0.536))  // Darker green
                            .bold()
                        
                        // Sign up link button
                        NavigationLink("sign up here !", destination: createAccountView())
                            .accentColor(.white)  // White text
                            .buttonStyle(.bordered)  // Adds border to button
                        
                        // User agreement notice
                        Text("By signing into Leaf you agree to our User Agreement.")
                            .foregroundColor(Color.white)  // White text
                            .multilineTextAlignment(.center)  // Center-aligned text
                            .offset(y: 80)  // Positioned lower on screen
    
                    } //VStack
                } //ZStack
            } //VStack
        } //Navigation View
    } //Some View
} //View


// SwiftUI Preview for this view in Xcode canvas
#Preview {
    LoginView()
}
