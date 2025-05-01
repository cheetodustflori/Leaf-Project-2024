//
//  create account.swift
//
//  This file defines the account creation screen for the Leaf application
//  Handles user registration flow and connects to Supabase backend

import SwiftUI
import Supabase  // Imports Supabase library for backend authentication and database services

struct createAccountView: View {
    // MVVM architecture - ViewModel to handle registration logic
    @StateObject var viewModel = createAccountViewViewModel()
    
    // State variables to track registration and authentication status
    @State private var isLoggedIn = false  // Tracks if user registration was successful
    @State private var errorMessage: String? = nil  // Stores registration error messages
    
    
    // Initialize the Supabase client for backend communication
    private var client: SupabaseClient
    
    init() {
        // Supabase configuration values
        let supabaseUrl1 = "https://wzuufzfcefaobfuklkex.supabase.co"  // Supabase project URL
        let supabaseKey1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6dXVmemZjZWZhb2JmdWtsa2V4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMyMDU1MzYsImV4cCI6MjA1ODc4MTUzNn0.1V037n_LLnKYJAFI2mJz3H8_1oE7WH8ikoU1peE_Kd0"  // Supabase anon key for public API access
        
        // Create and initialize the Supabase client
        self.client = SupabaseClient(supabaseURL: URL(string: supabaseUrl1)!, supabaseKey: supabaseKey1)
    }
    
    var body: some View {
        NavigationView {  // Enables navigation between screens
            VStack (spacing: 0) {  // Main container with no spacing between elements
                // Header component showing page title and subtitle
                headerView(title: "create account", subtitle: "fill out the form below !")
                
                // Registration form
                Form {
                    
                    // Conditional error message display
                    if !viewModel.errorMessage.isEmpty { //Don't change
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.blue)  // Display error in blue text
                    }
                    
                    // Full name input field
                    TextField("full name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())  // Default text field appearance
                        .autocorrectionDisabled()  // Disables autocorrect for name entry
                    
                    // Email address input field
                    TextField("email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)  // Prevents automatic capitalization for email
                        .autocorrectionDisabled()  // Disables autocorrect for email entry
                    
                    // Password input field with secure entry
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    

                    // Register Button
                    Button(action: {
                        viewModel.register()  // Calls the register method in the ViewModel
                    }) {
                        Text("Register")
                            .bold()
                            .frame(maxWidth: .infinity)  // Makes button take full width
                            .padding()
                            .background(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green background
                            .foregroundColor(.white)  // White text
                            .cornerRadius(8)  // Rounded corners
                    }
                    .padding()
                } //Form
                
                .offset(y: -25)  // Positions form 25 points up
                .background(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green background
                .scrollContentBackground(.hidden)  // Hides default form background
                
                // Hidden NavigationLink to programmatically navigate on successful registration
                NavigationLink(destination: introPage1View(), isActive: $viewModel.isLoggedIn) {
                    EmptyView()  // No visible content for this link
                }.navigationBarBackButtonHidden(true)  // Hides back button after registration
            }
            
        }
    }
}
    
// SwiftUI Preview for this view in Xcode canvas
struct createAccount_Previews: PreviewProvider {
    static var previews: some View {
        createAccountView()
    }
}
