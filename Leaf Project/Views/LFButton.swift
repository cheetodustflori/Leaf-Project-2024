//
//  LFButton.swift
//
//  Unused
//  Custom button
//

import SwiftUI

struct LFButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        
        Button {
            //action
            action()
            
        } label: {
            
        ZStack {
            RoundedRectangle(cornerRadius:10)
                .foregroundColor(Color(red: 0.7568627450980392, green: 0.8823529411764706, blue: 0.7568627450980392))
            
            Text(title)
                .bold()
                .foregroundColor(Color(.white))

        }
        }
        
        .padding()
        
        
    }
}

struct LFButton_Previews: PreviewProvider {
    static var previews: some View {
        LFButton(title: "sign in") {
            
        }
        //action
    }
}
