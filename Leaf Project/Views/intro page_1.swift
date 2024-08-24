//
//  intro page_2.swift
//  practice 2
//
//  Created by Quynh Tram on 11/4/23.
//

import SwiftUI

struct introPage1View : View {
 
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color(red: 0.621, green: 0.789, blue: 0.656))
                
                VStack {
                    
                    Text("You are a seed...")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                    Image("seed")
                    
                    Text("But with water, sunshine, and soil..")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    
                    NavigationLink("next !", destination: introPage2View())
                        .accentColor(.white)
                        .buttonStyle(.bordered)
                    
                }
                
                
            }
            
        }
        
        
        
        
    }
}

struct introPage1_Previews: PreviewProvider {
    static var previews: some View {
        introPage1View()
    }
}
