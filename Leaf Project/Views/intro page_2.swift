//
//  intro page_1.swift
//  practice 2
//
//  Created by Quynh Tram on 11/4/23.
//

import SwiftUI

struct introPage2View : View {
 
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                
                VStack {
                    
                    Text("... in no time you will \n grow into a tree")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                    Image("tree")
                    
                    Text("with many, \nmany leaves!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink("view your missions !", destination: missionTaskView())
                        .accentColor(.white)
                        .buttonStyle(.bordered)
                    
                }
                
                
            }
            
        }
        
        
        
    }
}

struct introPage2_Previews: PreviewProvider {
    static var previews: some View {
        introPage2View()
    }
}

