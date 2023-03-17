//
//  ButtonView.swift
//  swiftuibasics
//
//  Created by Koushith B R on 17/03/23.
//

import SwiftUI

struct ButtonView: View {
    
   @State var title: String = "This is my Title"
    var body: some View {
        VStack{
            Text(title)
           
            
            Button("Press Me"){
                self.title = "Button was pressed"
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
