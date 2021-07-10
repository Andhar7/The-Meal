//
//  BonosView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

struct BonosView: View {
    var body: some View {
        ZStack {
 
            Circle()
                .fill(LinearGradient(colors: [Color.orange, Color("Color3"), Color("Color3")], startPoint: .top, endPoint: .bottom))
                .mask(Circle().stroke(lineWidth: 5))
                .frame(width: 55, height: 55, alignment: .center)
                .rotationEffect(.degrees(21))
            
            Text("Bon appetit!")
                .font(.footnote).bold()
                .foregroundColor(.white)
                .opacity(0.9)
 
        }
    }
}

struct BonosView_Previews: PreviewProvider {
    static var previews: some View {
        BonosView()
    }
}
