//
//  ProfileView.swift
//  practice 2
//
//  Created by Quynh Tram on 11/14/23.
//

import SwiftUI

struct ProfileView: View {
//    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
          NavigationView {
        //    .navigationTitle("Profile")
        
              ZStack {
                  
                  Rectangle()
                      .ignoresSafeArea()
                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                      
                  
                  VStack (alignment: .leading, spacing: 20.0) {
                      
                      HStack {
                          
                          VStack{
                           
                              Rectangle().foregroundColor(.white)
                                  .cornerRadius(10)
                                  .frame(width: 115, height: 40)
                                  .offset(y:20)
                                  .offset(x:20)
                              
                              
                              Text("Profile")
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  .multilineTextAlignment(.leading)
                                  .offset(y:-25)
                                  .offset(x:20)
                              
                          }
                          
                          
                          Spacer()
                          
                          Image(systemName: "pencil.circle.fill")
                              .foregroundColor(Color.white)
                              .scaleEffect(CGSize(width: 2.0, height: 2.0))
                              .offset(x:-30)
                          
                      }
                      
                      Spacer()
                          .frame(height:20)
                      
                      ZStack {
                          
                          Rectangle().foregroundColor(.white)
                              .cornerRadius(15)
                              .shadow(radius:15)
                              .frame(height: 450)
                              .padding()
                          
                          Circle().stroke(Color(red: 0.513, green: 0.703, blue: 0.553),lineWidth: 10)
                              .fill(Color(red: 0.513, green: 0.703, blue: 0.553))
                              .offset(y:-230)
                              .frame(width: 150, height: 150)
                          
                          Image(systemName: "person.circle.fill")
                              .foregroundColor(Color.white)
                              .scaleEffect(CGSize(width: 8.5, height: 8.5))
                              .offset(y:-230)
                          
                          VStack {
                              
                              Image("leaf_logo")
                                  .resizable()
                                  .frame(width: 100, height: 100, alignment: .center)
                                  .foregroundColor(Color.red)
                                  .scaleEffect(x: 0.5, y: 0.5)
                              HStack{
                                  Text("@username")
                                      .bold()
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  Spacer()
                                      .frame(width:5)
                                  Text("Name")
                              }
                              
                              HStack{
                                  Text("Rank:")
                                      .bold()
                                  Spacer()
                                      .frame(width:5)
                                  Image(systemName: "star.fill")
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  Image(systemName: "star.fill")
                                      .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  Image(systemName: "star")
                                  Image(systemName: "star")
                              }
                              
                              HStack{
                                  Text("Date Joined:")
                                      .bold()
                                  Text("0/0/0000")
                              }
                              
                              
                              Spacer()
                                  .frame(height: 100)
                              
                              NavigationLink("sign out !", destination: LoginView())
                                  .accentColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                                  .buttonStyle(.bordered)
                              
                          }
                          
                          
                          
                          
                      }
                      
                      
                  }
              }
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
}
}
