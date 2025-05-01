//
//  intro page_2.swift
//
//  This file defines the second onboarding screen in the sequence
//  Continues the plant growth metaphor and leads to the main app functionality

import SwiftUI

struct introPage2View : View {
 
    
    var body: some View {
        
        NavigationView {  // Container for navigation functionality
            
            ZStack{  // Layered content container (background + content)
                
                // Full-screen background with green color
                Rectangle()
                    .ignoresSafeArea()  // Extends beyond safe area boundaries
                    .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))  // Light green color matching app theme
                
                VStack {  // Vertical stack for main content
                    
                    // First text message continuing the metaphor from previous screen
                    Text("... in no time you will \n grow into a tree")
                        .font(.title)  // Larger text size
                        .fontWeight(.bold)  // Bold text for emphasis
                        .foregroundColor(Color.white)  // White text for contrast against green
                        .multilineTextAlignment(.center)  // Center-aligned text
                        
                    // Tree image from assets - showing growth from the seed in previous screen
                    Image("tree")  // Displays an image named "tree" from the asset catalog
                    
                    // Second text message completing the metaphor
                    Text("with many, \nmany leaves!")
                        .font(.title)  // Larger text size
                        .fontWeight(.bold)  // Bold text for emphasis
                        .foregroundColor(Color.white)  // White text for contrast against green
                        .multilineTextAlignment(.center)  // Center-aligned text
                    
                    // Navigation button to exit onboarding and enter the main app
                    NavigationLink("view your missions !", destination: missionTaskView())  // Button that navigates to main mission/task screen
                        .accentColor(.white)  // White text/border color
                        .buttonStyle(.bordered)  // Adds border to the button
                    
                }
            }
        }.navigationBarBackButtonHidden(true)  // Hides the back button to enforce linear onboarding flow
        
        
        
    }
}

// SwiftUI Preview for this view in Xcode canvas
struct introPage2_Previews: PreviewProvider {
    static var previews: some View {
        introPage2View()  // Provides a preview of this view in the Xcode canvas
    }
}
