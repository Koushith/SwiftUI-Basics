//
//  InitilizerView.swift
//  swiftuibasics
//
//  Created by Koushith B R on 17/03/23.
//

import SwiftUI

struct InitilizerView: View {
    
    let backgroundColor : Color
    let text : String
    
    init(backgroundColor: Color, text: String) {
        self.backgroundColor = backgroundColor
        self.text = text
    }
    
    var body: some View {
        VStack(spacing:20){
            Text("\(text)")
                .underline()
                .font(.headline)
                .foregroundColor(.white)
            

            Text("Koushith")
        }.frame(width: 250, height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
        
    }
}

struct InitilizerView_Previews: PreviewProvider {
    static var previews: some View {
        InitilizerView(backgroundColor: .red, text: "Hellooooooooooo")
    }
}
