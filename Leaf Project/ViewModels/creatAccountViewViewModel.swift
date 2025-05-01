//
//  creatAccountViewViewModel.swift
//  practice 2
//
//  This file implements the ViewModel for the account creation screen following MVVM pattern
//  Handles user registration logic, Supabase API communication, and state management

import Foundation
import Supabase  // Import Supabase SDK for authentication and database features

class createAccountViewViewModel: ObservableObject {
    // Published properties that the View can observe and bind to
    @Published var name = ""  // Stores the user's full name input
    @Published var email = ""  // Stores the user's email address input
    @Published var password = ""  // Stores the user's password input
    @Published var errorMessage: String = ""  // Stores registration error messages
    @Published var isLoggedIn: Bool = false  // Tracks authentication state after registration
    
    // Private Supabase client instance for backend communication
    private var client: SupabaseClient
    
    init() {
        // Supabase project credentials
        let supabaseUrl1 = "https://wzuufzfcefaobfuklkex.supabase.co"  // URL for Supabase instance
        let supabaseKey1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6dXVmemZjZWZhb2JmdWtsa2V4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMyMDU1MzYsImV4cCI6MjA1ODc4MTUzNn0.1V037n_LLnKYJAFI2mJz3H8_1oE7WH8ikoU1peE_Kd0"  // Public API key
        
        // Initialize Supabase client with credentials
        self.client = SupabaseClient(supabaseURL: URL(string: supabaseUrl1)!, supabaseKey: supabaseKey1)
    }
    
    // Registration method called when user taps register button
    func register() {
        errorMessage = ""  // Clear any previous error messages
        Task {
            do {
                // Call Supabase authentication API to sign up new user
                let response = try await client.auth.signUp(
                    email: email,
                    password: password,
                    data: ["first_name": .string(name)]  // Store additional user data (name)
                )
                print("Signed up! Session: \(response)")  // Debug log on successful registration
                
                // Update UI state on the main thread after successful registration
                await MainActor.run {
                    self.isLoggedIn = true  // Triggers navigation to onboarding via NavigationLink
                }
                
            } catch {
                // Handle registration errors
                await MainActor.run {
                    self.errorMessage = error.localizedDescription  // Display error message from API
                }
            }
        }
    }
}


