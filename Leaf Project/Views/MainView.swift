//
//  MainView.swift
//
//  This view is the starting point of the app: which points to
//  the login view
//
//

import SwiftUI // SwiftUI framework for building user interfaces
import Supabase // Supabase client library for backend services

// Set up Supabase client with your Supabase URL and Key
let supabaseUrl1 = "https://wzuufzfcefaobfuklkex.supabase.co" //Supabase project URL
let supabaseKey1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6dXVmemZjZWZhb2JmdWtsa2V4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMyMDU1MzYsImV4cCI6MjA1ODc4MTUzNn0.1V037n_LLnKYJAFI2mJz3H8_1oE7WH8ikoU1peE_Kd0"

// Create the Supabase client, instantiate the Supabase client using your URL and key
let supabaseClient = SupabaseClient(supabaseURL: URL(string: supabaseUrl1)!, supabaseKey: supabaseKey1)

// The main entry point of the app’s UI
// Wraps the login flow in a navigation controller and hides the back button.
struct MainView: View {
    var body: some View {
        NavigationView {  // Provides a navigation stack
            LoginView() // The first screen shown: LoginView.swift
        }.navigationBarBackButtonHidden(true) // disable the automatic back button
    }
}

// enables the SwiftUI canvas in Xcode to show a live preview of MainView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView() // render MainView in the preview
    }
}
