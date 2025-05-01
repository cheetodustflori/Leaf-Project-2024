//
//  intro page_2.swift
//
//  This file defines the first onboarding screen in a sequence
//  Displays a metaphorical introduction about growth with a seed visual

import SwiftUI

struct introPage1View : View {
 
    var body: some View {
        
        NavigationView{  // Container for navigation functionality
            
            ZStack{  // Layered content container (background + content)
                
                // Full-screen background with green color
                Rectangle()
                    .ignoresSafeArea()  // Extends beyond safe area boundaries
                    .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green color matching app theme
                
                VStack {  // Vertical stack for main content
                    
                    // First text message
                    Text("You are a seed...")
                        .font(.title)  // Larger text size
                        .fontWeight(.bold)  // Bold text for emphasis
                        .foregroundColor(Color.white)  // White text for contrast against green
                        .multilineTextAlignment(.center)  // Center-aligned text
                        
                    // Seed image from assets
                    Image("seed")  // Displays an image named "seed" from the asset catalog
                    
                    // Second text message
                    Text("But with water, sunshine, and soil..")
                        .font(.title)  // Larger text size
                        .fontWeight(.bold)  // Bold text for emphasis
                        .foregroundColor(Color.white)  // White text for contrast against green
                        .multilineTextAlignment(.center)  // Center-aligned text
                    
                    
                    // Navigation button to the next intro screen
                    NavigationLink("next !", destination: introPage2View())  // Button that navigates to the second intro page
                        .accentColor(.white)  // White text/border color
                        .buttonStyle(.bordered)  // Adds border to the button
                }
            }
        }.navigationBarBackButtonHidden(true)  // Hides the back button to enforce linear onboarding flow
    }
}

// SwiftUI Preview for this view in Xcode canvas
struct introPage1_Previews: PreviewProvider {
    static var previews: some View {
        introPage1View()  // Provides a preview of this view in the Xcode canvas
    }
}
