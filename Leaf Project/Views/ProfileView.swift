//
//  ProfileView.swift
//
//  Unused
//  This file defines a user profile view using SwiftUI

import SwiftUI

struct ProfileView: View {
    // This commented out line would create a view model following MVVM pattern
    // @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
          NavigationView {
              // Navigation title is commented out
              // .navigationTitle("Profile")
        
              ZStack {
                  // Creates a background rectangle with a green color
                  // ZStack layers views with the first one at the bottom
                  Rectangle()
                      .ignoresSafeArea() // Extends beyond safe area boundaries
                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656)) // Light green color
                      
                  
                  VStack (alignment: .leading, spacing: 20.0) {
                      // Main vertical stack with left alignment and 20pt spacing
                      
                      HStack {
                          // Header section with profile title and edit button
                          
                          VStack{
                              // Container for the "Profile" text with white background
                              Rectangle().foregroundColor(.white)
                                  .cornerRadius(10) // Rounds the corners
                                  .frame(width: 115, height: 40) // Fixed size
                                  .offset(y:20) // Positions 20pts down
                                  .offset(x:20) // Positions 20pts right
                              
                              // Profile title text
                              Text("Profile")
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656)) // Matches background
                                  .multilineTextAlignment(.leading)
                                  .offset(y:-25) // Overlaps with the white rectangle above
                                  .offset(x:20)
                              
                          }
                          
                          Spacer() // Pushes edit button to the right
                          
                          // Edit profile button (pencil icon)
                          Image(systemName: "pencil.circle.fill") // SF Symbol icon
                              .foregroundColor(Color.white)
                              .scaleEffect(CGSize(width: 2.0, height: 2.0)) // Makes icon larger
                              .offset(x:-30) // Positions 30pts from right edge
                          
                      }
                      
                      // Add vertical spacing
                      Spacer()
                          .frame(height:20)
                      
                      ZStack {
                          // Main profile content card
                          
                          // White card background
                          Rectangle().foregroundColor(.white)
                              .cornerRadius(15) // Rounded corners
                              .shadow(radius:15) // Drop shadow effect
                              .frame(height: 450) // Fixed height
                              .padding() // Adds spacing around the card
                          
                          // Profile picture background circle
                          Circle().stroke(Color(red: 0.513, green: 0.703, blue: 0.553),lineWidth: 10)
                              .fill(Color(red: 0.513, green: 0.703, blue: 0.553)) // Darker green
                              .offset(y:-230) // Positions at top of card
                              .frame(width: 150, height: 150) // Fixed size
                          
                          // User avatar placeholder
                          Image(systemName: "person.circle.fill") // SF Symbol for person
                              .foregroundColor(Color.white)
                              .scaleEffect(CGSize(width: 8.5, height: 8.5)) // Large size
                              .offset(y:-230) // Aligns with circle background
                          
                          VStack {
                              // User profile details stack
                              
                              // App logo
                              Image("leaf_logo") // Custom image from assets
                                  .resizable()
                                  .frame(width: 100, height: 100, alignment: .center)
                                  .foregroundColor(Color.red) // Not visible since using image asset
                                  .scaleEffect(x: 0.5, y: 0.5) // Makes the image smaller
                              
                              // Username and name row
                              HStack{
                                  Text("@username")
                                      .bold()
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656)) // Green text
                                  Spacer()
                                      .frame(width:5) // Small horizontal spacing
                                  Text("Name") // Real name placeholder
                              }
                              
                              // User rank with star rating
                              HStack{
                                  Text("Rank:")
                                      .bold()
                                  Spacer()
                                      .frame(width:5)
                                  // Rating stars (2 filled, 2 empty)
                                  Image(systemName: "star.fill")
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  Image(systemName: "star.fill")
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  Image(systemName: "star") // Empty star
                                  Image(systemName: "star") // Empty star
                              }
                              
                              // Account creation date
                              HStack{
                                  Text("Date Joined:")
                                      .bold()
                                  Text("0/0/0000") // Placeholder date
                              }
                              
                              // Vertical spacing before sign out button
                              Spacer()
                                  .frame(height: 100)
                              
                              // Sign out button with navigation to login screen
                              NavigationLink("sign out !", destination: LoginView())
                                  .accentColor(Color(red: 0.621, green: 0.789, blue: 0.656)) // Green text
                                  .buttonStyle(.bordered) // Adds border to button
                              
                          }
                      }
                  }
              }
        }
    }
}

// Preview provider for SwiftUI canvas
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView() // Creates instance for preview
    }
}
