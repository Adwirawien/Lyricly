//
//  Caption.swift
//  Lyricly
//
//  Created by Adrian Böhme on 01.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import SwiftUI

struct Caption: View {
    var name: String
    
    var body: some View {
        HStack {
            Text(name)
                .padding(.horizontal)
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct Caption_Previews: PreviewProvider {
    static var previews: some View {
        Caption(name: "example")
    }
}
