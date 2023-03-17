//
//  ForEachView.swift
//  swiftuibasics
//
//  Created by Koushith B R on 17/03/23.
//

import SwiftUI

struct ForEachView: View {
    
    let data : [String] = ["hii", "hello", "how are you"]
    
   
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(data.indices){
                    index in Text("\(data[index]) : \(index)")
                }
                
                ForEach(0..<100){ index in
                    Circle().frame(height:20).foregroundColor(.red)
                    
                }
            }
        }
       
    }
}

struct ForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachView()
    }
}
