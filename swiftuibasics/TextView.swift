//
//  TextView.swift
//  swiftuibasics
//
//  Created by Koushith B R on 17/03/23.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("koushith")
            .foregroundColor(.red)
            .bold()
            .underline()
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
