//
//  LoginViewViewModel.swift
//  practice 2
//
//  This file implements the ViewModel for the login screen following the MVVM pattern
//  Handles user authentication logic, Supabase API communication, and state management

import Foundation
import Supabase  // Import Supabase SDK for authentication and database features

class LoginViewViewModel: ObservableObject {
    // Published properties that the View can observe and bind to
    @Published var username: String = ""  // Stores the username/email input
    @Published var password: String = ""  // Stores the password input
    @Published var errorMessage: String = ""  // Stores authentication error messages
    @Published var isLoggedIn: Bool = false  // Tracks authentication state
    
    // Private Supabase client instance for backend communication
    private var client: SupabaseClient

    init() {
        // Supabase project credentials
        let supabaseUrl1 = "https://wzuufzfcefaobfuklkex.supabase.co"  // URL for Supabase instance
        let supabaseKey1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6dXVmemZjZWZhb2JmdWtsa2V4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMyMDU1MzYsImV4cCI6MjA1ODc4MTUzNn0.1V037n_LLnKYJAFI2mJz3H8_1oE7WH8ikoU1peE_Kd0"  // Public API key

        // Initialize Supabase client with credentials
        self.client = SupabaseClient(supabaseURL: URL(string: supabaseUrl1)!, supabaseKey: supabaseKey1)
    }
    
    // Authentication method called when user taps login button
    func login() {
        errorMessage = ""  // Clear any previous error messages
        
        // Create an asynchronous task for network operations
        Task {
            do {
                // Call Supabase authentication API to sign in
                let session = try await client.auth.signIn(email: username, password: password)
                print("Logged in! Session: \(session)")  // Debug log on successful authentication
                
                // Update UI state on the main thread after successful login
                await MainActor.run {
                    self.isLoggedIn = true  // Triggers navigation to next screen via NavigationLink
                }
            } catch {
                // Handle authentication errors
                await MainActor.run {
                    self.errorMessage = error.localizedDescription  // Display error message from API
                }
            }
        }
    }
}
