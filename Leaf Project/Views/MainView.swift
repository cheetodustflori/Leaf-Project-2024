//
//  ContentView.swift
//  practice 2
//
//  Created by Quynh Tram on 11/4/23.
//

import SwiftUI

struct MainView: View {
    
   // @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
      /*  if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            missionTaskView()
       TabView {
       ToDoListView(userId: )
       .tabItem {
       Label("Home", systemImage: "house")
        }
       
       ProfileView()
        .tabItem {
            Label("Profile", systemImage:
                        "person.circle")
       }
       
       **/
        
        NavigationView { 
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
