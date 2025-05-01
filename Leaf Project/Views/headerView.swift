//
//  headerView.swift
//
//  This file defines a reusable header component used across multiple screens
//  in the Leaf application, providing consistent branding and layout

import SwiftUI

struct headerView: View {
   let title: String   // Main title text to display (e.g., "Welcome to Leaf")
   let subtitle: String  // Secondary text to display (e.g., "Login")
    
    
    var body: some View {
        
        ZStack {  // Layered container (background + content)
            
            // Background color - consistent with app's green theme
            Color(red: 0.621, green: 0.789, blue: 0.656)
                .ignoresSafeArea()  // Extends color beyond safe area
            
            VStack (spacing: 0) {  // Vertical container with no spacing between elements
                // Main title text
                Text(title)
                    .font(.largeTitle)  // Largest built-in font size
                    .foregroundColor(Color.white)  // White text for contrast on green
                    .bold()  // Bold weight for emphasis
                    
                
                // App logo image
                Image("leaf_logo")
                    .resizable()  // Allows image to be resized
                    .cornerRadius(10)  // Rounded corners on the image
                    .aspectRatio(contentMode: .fit)  // Maintains aspect ratio
                    .frame(width: 100)  // Fixed width, height adjusts proportionally
                    .padding(.all)  // Adds padding on all sides
                
                // Subtitle text
                Text(subtitle)
                    .font(.title)  // Second largest built-in font size
                    .bold()  // Bold weight
                    .foregroundStyle(Color(.white))  // White text
                    .italic()  // Italic style for visual distinction
                
                
            }
        }
    }
}

// Preview provider for SwiftUI canvas
struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView(title: "Title", subtitle: "Subtitle")  // Sample data for preview
    }
}
